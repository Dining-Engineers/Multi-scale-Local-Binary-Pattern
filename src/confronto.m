% get images
% image1 = imread('grey_brick01.jpg');
% image2 = mat2gray(imread('grey_brick01.jpg'));

image1 = imread('B1.bmp');
image2 = imread('F1.bmp');

% map the value to uniform implementation
mapping = getmapping(8,'u2');

% number of lbp/histogram 
radii = [ 3 6 9 12 ];

% define region rows and columns
% an histogram for each region will be calculated
num_region_rows = 3;
num_region_cols = 3;

descriptor1 = getMLBPDescriptor( image1, mapping, radii, num_region_rows, num_region_cols );
descriptor2 = getMLBPDescriptor( image2, mapping, radii, num_region_rows, num_region_cols );


A = zeros( size(descriptor2, 1), size(descriptor1, 1) );

for i = 1:size(descriptor2, 1)
   for j = 1:size(descriptor1, 1)
       A(i,j) = getNormalizedCorrelation( descriptor2(i, : ), descriptor1( j, : ) );
%        A(i,j) = getHistogramIntersection( descriptor2(i, : ), descriptor1( j, : ) );
%        A(i,j) = getChiSquareCriterion( descriptor2(i, : ), descriptor1( j, : ) );
%        A(i,j) = getLogLikelihoodRatio( descriptor2(i, : ), descriptor1( j, : ) );
       
   end
   
   figure;
   subplot(1,2,1), imshow(showGridMeasure(image2, num_region_rows, num_region_cols, i-1 )  )
   subplot(1,2,2), imshow(showGridMeasure(image1, num_region_rows, num_region_cols, A(i,:) )  )
end