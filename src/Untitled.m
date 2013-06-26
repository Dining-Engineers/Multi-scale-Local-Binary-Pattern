
img = imread('grey_brick01.jpg');
sigma = 5;
figure;
imshow(img);
tic;
% use gaussian operator
mask = makeGauss(sigma);

imgOut_g = imfilter(img, mask, 'conv');

toc
figure;
imshow(imgOut_g);

kernelSize = 2*sigma+1;
tic;
myfilter = fspecial('gaussian',5, 3);
myfilteredimage = imfilter(img, myfilter, 'replicate');
toc
figure;
imshow(myfilteredimage);
