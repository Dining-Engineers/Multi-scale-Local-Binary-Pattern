function [training_mean, training_std, test_statistic_measures, reject ] = computeRejectedRegions( image, training_regions, radii, num_region_rows, num_region_cols, sigma_coefficient )
%COMPUTEREJECTEDREGIONS Summary of this function goes here
%   Detailed explanation goes here

    % map the value to uniform implementation
    mapping = getmapping(8,'u2');
    % mapping = getmapping(8,'complete');

    descriptor = getMLBPDescriptor( image, mapping, radii, num_region_rows, num_region_cols, sigma_coefficient );
    
    A = zeros( size(descriptor, 1) );

    % A is a symmetric matrix
    for i = 1:size(descriptor, 1)
        for j = i:size(descriptor, 1)
            % A(i,j) = getNormalizedCorrelation( descriptor(i, : ), descriptor( j, : ) );
            % A(i,j) = getHistogramIntersection( descriptor(i, : ), descriptor( j, : ) );
            % A(i,j) = getChiSquareCriterion( descriptor(i, : ), descriptor( j, : ) );
            % A(i,j) = getLogLikelihoodRatio( descriptor(i, : ), descriptor( j, : ) );
            A(i,j) = getCrossNormalizedCorrelation( descriptor(i, : ), descriptor( j, : ) );
        end
    end
    
    A = A - tril(A) + A';
    
    training_correlation = A( training_regions+1, training_regions+1 );
    training_correlation =  training_correlation(triu(true(size(training_correlation)), 1));

    %training_correlation(find(~tril(ones(size(training_correlation)))));

    training_mean = mean2( training_correlation )
    training_std = std2( training_correlation );

    reject = zeros( num_region_rows*num_region_cols, 1 );
    accept = zeros( num_region_rows*num_region_cols, 1 );
    
    % test_statistic_measures is a nx3 matrix
    %
    %   _ _ _ _ _ _ _ _ _ _ 
    %  |_mean_|_std_|_index_|
    %  |_ _ _ |_ _ _|_ _ _ _|  
    %  |_ _ _ |_ _ _|_ _ _ _|
    %  |_ _ _ |_ _ _|_ _ _ _|
    %  |      |     |       |
    %
    
    test_statistic_measures = zeros( num_region_rows*num_region_cols - length(training_regions), 3 );

    not_training_counter = 1;
    for k = 0:( num_region_rows*num_region_cols-1 )
        if ~(any( k == training_regions ) )
            
            test_values = A(  k+1, training_regions+1 );
            
            test_values =  test_values(triu(true(size(test_values)), 1));

                
            test_mean = mean2( test_values );
            test_std = std2( test_values );
            
            test_statistic_measures(not_training_counter, 1) = test_mean;
            test_statistic_measures(not_training_counter, 2) = test_std;
            test_statistic_measures(not_training_counter, 3) = k;
            
            if ( test_mean <= ( training_mean - 3*training_std ) || ...
                    test_mean >= ( training_mean + 3*training_std ) )
                % reject
                reject(k+1) = k;
            else
                % accept
                accept(k+1) = k;
            end
            not_training_counter = not_training_counter + 1;
        end
    end
    
    reject = find( reject(:) ~= 0 ) - 1;
    reject = reject';
end

