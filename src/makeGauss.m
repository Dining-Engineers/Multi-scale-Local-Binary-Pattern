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

function kernel = makeGauss(sigma)
% function kernel = makeGauss(kernelSize, sigma)
% kernelSize is a scalar value. The returned kernel size is [kernelSize kernelSize]

kernelSize = 2*int8(sigma)+1;
central = (kernelSize+1)/2;
nFactor=0.0;
for i=1:kernelSize,
    for j=1:kernelSize,
        kernel(i,j)=exp(-(double(i-central)^2+double(j-central)^2)/2.0/sigma/sigma);
        nFactor = nFactor + kernel(i,j);
    end
end
kernel = kernel ./ nFactor;
