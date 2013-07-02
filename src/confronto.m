% Authors:  - Andrea Rizzo, andrearizzo [at] outlook.com
%           - Matteo Bruni, matteo.bruni [at] gmail.com
%             
% Date: 20/06/2013
%
% You are free to use, change, or redistribute this code in any way you
% want for non-commercial purposes. However, it is appreciated if you 
% maintain the name of the original author.
%
% (C) A.Rizzo, M. Bruni

% get images
image1 = imread('C1R3EBRB.TIF');%C1R3EBRB,C1R3EBQY
image2 = image1;

% define region rows and columns
% an histogram for each region will be calculated
%
% for example if you set
%         
%   num_region_rows = 3;
%   num_region_cols = 3;
%         
% you obtain
%   _ _ _ _ _ _ 
%  |_1_|_2_|_3_|
%  |_4_|_5_|_6_|
%  |_7_|_8_|_9_|
%
num_region_rows = 5;
num_region_cols = 10;

% Are the numbers that identify the correct regions
correct_regions = [26:29, 36:39]
% correct_regions = correct_regions+1

% map the value to uniform implementation
mapping = getmapping(8,'u2');

% number of lbp/histogram 
radii = [ 3 6 9 12 ];

descriptor1 = getMLBPDescriptor( image1, mapping, radii, num_region_rows, num_region_cols );
descriptor2 = getMLBPDescriptor( image2, mapping, radii, num_region_rows, num_region_cols );

A = zeros( size(descriptor2, 1), size(descriptor1, 1) );

for i = 1:size(descriptor2, 1)
   for j = 1:size(descriptor1, 1)
       A(i,j) = getNormalizedCorrelation( descriptor2(i, : ), descriptor1( j, : ) );
   end
   %{
    figure;
    subplot(1,2,1), imshow(showGridMeasure(image2, num_region_rows,
    num_region_cols, i-1) );
   subplot(1,2,2), imshow(showGridMeasure(image1, num_region_rows,
   num_region_cols, A(i,:) ));
   %}
end

figure;
imshow( showGridMeasure( image2, num_region_rows, num_region_cols, 0:num_region_rows*num_region_cols-1 ) );

correct_correlation = A( correct_regions+1, correct_regions+1 );
correct_mean = mean2( correct_correlation )
correct_std = std2( correct_correlation )

reject = zeros( num_region_rows*num_region_cols, 1 );
accept = zeros( num_region_rows*num_region_cols, 1 );

for k = 0:( num_region_rows*num_region_cols - 1 )
    if any( k ~= correct_regions )
        test_mean = mean2( A(k+1,correct_regions+1) );
        test_std = std2( A(k+1,correct_regions+1) );
        if ( test_mean <= ( correct_mean - 3*correct_std ) || ...
                test_mean >= ( correct_mean + 3*correct_std ) )
            % reject
            reject(k+1) = k;
            k
            test_mean
        else
            % accept
            accept(k+1) = k;
        end
    end
end

reject = find( reject(:) ~= 0 ) - 1;
reject = reject'