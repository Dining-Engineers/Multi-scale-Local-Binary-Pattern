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
% image1 = imread('grey_brick01.jpg');
% image2 = rgb2gray(imread('grey_brick01mod.jpg'));

image1 = imread('C1R3EBRX.TIF');%C1R3EBRB,C1R3EBQY
image2 = image1;
correct_regions = 25:29, 40:49 ;
correct_regions = correct_regions+1;

%image1 = rgb2gray(imread('B1.bmp'));
%image2 = imread('F1.bmp');
% image1 = edge(image1,'canny', []);
% image2 = edge(image2,'canny', 0.2);

% map the value to uniform implementation
mapping = getmapping(8,'u2');

% number of lbp/histogram 
radii = [ 3 6 9 12 ];

% define region rows and columns
% an histogram for each region will be calculated
num_region_rows = 5;
num_region_cols = 10;

descriptor1 = getMLBPDescriptor( image1, mapping, radii, num_region_rows, num_region_cols );
descriptor2 = getMLBPDescriptor( image2, mapping, radii, num_region_rows, num_region_cols );


A = zeros( size(descriptor2, 1), size(descriptor1, 1) );
B = zeros( size(descriptor2, 1), size(descriptor1, 1) );

for i = 1:size(descriptor2, 1)
   for j = 1:size(descriptor1, 1)
       A(i,j) = getNormalizedCorrelation( descriptor2(i, : ), descriptor1( j, : ) );
%        A(i,j) = getHistogramIntersection( descriptor2(i, : ), descriptor1( j, : ) );
%        A(i,j) = getChiSquareCriterion( descriptor2(i, : ), descriptor1( j, : ) );
%        A(i,j) = getLogLikelihoodRatio( descriptor2(i, : ), descriptor1( j, : ) );
         %B(i,j) = corr2( descriptor2(i, : ), descriptor1( j, : ) );
   end
  
   %figure;
   %subplot(1,2,1), imshow(showGridMeasure(image2, num_region_rows, num_region_cols, i-1 )  )
   %subplot(1,2,2), imshow(showGridMeasure(image1, num_region_rows, num_region_cols, A(i,:) )  )
end
figure; imshow(showGridMeasure(image2, num_region_rows, num_region_cols, 0:num_region_rows*num_region_cols-1 ));
A


correct_correlation = A(correct_regions,correct_regions);
correct_mean = mean2(correct_correlation);
correct_std = std2(correct_correlation);

for k = 0:( num_region_rows*num_region_cols - 1 )
    
    if any(k ~= correct_regions)
        test_mean = mean2(A(k+1,correct_regions));
        test_std = std2(A(k+1,correct_regions));
        if ( test_mean <= ( correct_mean - 3*correct_std) || ...
                test_mean >= ( correct_mean + 3*correct_std) )
            % reject
            k
        else
            % accept
            k;
        end
    end
end

%     figure; imshow(showGridMeasure(image2, num_region_rows, num_region_cols, 0:num_region_rows*num_region_cols-1 ));


%B