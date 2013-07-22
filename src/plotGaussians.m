function plotGaussians( training_mean, training_std, test_statistic_measures, reject, from, num, Title )
%PLOTGAUSSIANS Summary of this function goes here
%   Detailed explanation goes here
%   from = 1 prendo num, rejected incluse
%   from = x ne prendo num a partire da x
      
        figure;

        x = test_statistic_measures(1,1) - 4*test_statistic_measures(1,2):0.0001:training_mean + 3*training_std;
        y_training = gaussmf( x,[ training_std training_mean] );

        % number of worst regions
        y_gaussian_worst_regions = zeros( num,  length(x));

        hold on;
        cc=hsv(num+1);
        p = zeros((num+1),1);

        l = strcat({'region '},int2str((       test_statistic_measures(from:from+num,3)       ))).';
        l(num+1) = {'training'};

        counter = 1;
        for k = from:from+num
            y_gaussian_worst_regions( counter, :) = gaussmf( x, [ test_statistic_measures(k,2) test_statistic_measures(k,1) ] );
            p(counter) = plot( x, y_gaussian_worst_regions(counter, :), 'color', cc(counter,:));
            counter = counter+1;
        end

        p(num+1) = plot( x, y_training, 'color', cc(num+1,:));
        plot( ( training_mean - 3*training_std ) , 0:0.001:1 );
        plot( ( training_mean + 3*training_std ) , 0:0.001:1 );
        
        title( Title );        
        legend( p, l,'Location','BestOutside' ); %,'Orientation','horizontal');
        xlabel( strcat('gaussmf, P=[', num2str(training_mean), ', ', num2str(training_std), ']') );

end

