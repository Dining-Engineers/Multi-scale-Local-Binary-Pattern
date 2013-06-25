% get the image
I1 = imread('grey_brick01.jpg');%'grey_brick01.jpg');
I2 = imread('grey_sub_brick01.jpg');%'grey_brick01.jpg');
I3 = imread('sub02_1.1.02.png');%'grey_brick01.jpg');
I4 = imread('grey_brick01.jpg');

% map the value to uniform implementation
mapping = getmapping(8,'u2');

% number of lbp/histogram 
hist_number = 3;%4;

% define region rows and columns
% an histogram for each region will be calculated
region_rows = 3;
region_cols = 3;

descriptor1 = getMLBPDescriptor( I1, mapping, hist_number, region_rows, region_cols );
descriptor2 = getMLBPDescriptor( I2, mapping, hist_number, region_rows, region_cols );
descriptor3 = getMLBPDescriptor( I3, mapping, hist_number, region_rows, region_cols );
descriptor4 = getMLBPDescriptor( I4, mapping, hist_number, region_rows, region_cols );

% measure = getClassifierFusion(descriptor1,descriptor1)
% measure1 = getClassifierFusion(descriptor1,descriptor2)
% measure2 = getClassifierFusion(descriptor1,descriptor3)
% measure3 = getClassifierFusion(descriptor1,descriptor4)

Wpca1 = pca(descriptor1);
% size(Wpca1)
% size(descriptor1)
valoripcati1 = descriptor1'*Wpca1;
Wpca2 = pca(descriptor2);
valoripcati2 = descriptor2'*Wpca2;
Wpca3 = pca(descriptor3);
valoripcati3 = descriptor3'*Wpca3;
Wpca4 = pca(descriptor4);
valoripcati4 = descriptor4'*Wpca4;

measure = getClassifierFusion(valoripcati1,valoripcati1, 'ncorr' );
measure1 = getClassifierFusion(valoripcati1,valoripcati2, 'ncorr' );
measure2 = getClassifierFusion(valoripcati1,valoripcati3, 'ncorr' );
measure3 = getClassifierFusion(valoripcati1,valoripcati4, 'ncorr' );

% options = [];
% options.Fisherface = 1;
% 
% gnd = [ones(59,1); ones(59,1)*2; ones(59,1)*3 ];
% [eigvector, eigvalue] = LDA(gnd, options, descriptor1');
% lda1 = descriptor1'*eigvector;
% 
% gnd = [ones(59,1); ones(59,1)*2; ones(59,1)*3 ];
% [eigvector, eigvalue] = LDA(gnd, options, descriptor2');
% lda2 = descriptor2'*eigvector;
% 
% gnd = [ones(59,1); ones(59,1)*2; ones(59,1)*3 ];
% [eigvector, eigvalue] = LDA(gnd, options, descriptor3');
% lda3 = descriptor3'*eigvector;
% 
% gnd = [ones(59,1); ones(59,1)*2; ones(59,1)*3 ];
% [eigvector, eigvalue] = LDA(gnd, options, descriptor4');
% lda4 = descriptor4'*eigvector;
% 
% measure = getClassifierFusion(lda1,lda1)
% measure1 = getClassifierFusion(lda1,lda2)
% measure2 = getClassifierFusion(lda1,lda3)
% measure3 = getClassifierFusion(lda1,lda4)

options = [];
options.Fisherface = 1;

gnd = 1:size(descriptor1,1);
[eigvector, eigvalue] = LDA(gnd, options, descriptor1);
lda1 = descriptor1*eigvector;

gnd = 1:size(descriptor2, 1);
[eigvector, eigvalue] = LDA(gnd, options, descriptor2);
lda2 = descriptor2*eigvector;

gnd = 1:size(descriptor3,1);
[eigvector, eigvalue] = LDA(gnd, options, descriptor3);
lda3 = descriptor3*eigvector;

gnd = 1:size(descriptor4,1);
[eigvector, eigvalue] = LDA(gnd, options, descriptor4);
lda4 = descriptor4*eigvector;

% measure = getClassifierFusion(lda1,lda1)
% measure1 = getClassifierFusion(lda1,lda2)
% measure2 = getClassifierFusion(lda1,lda3)
% measure3 = getClassifierFusion(lda1,lda4)




















