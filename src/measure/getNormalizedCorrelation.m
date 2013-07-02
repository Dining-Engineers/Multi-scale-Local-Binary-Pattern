function [ measure ] = getNormalizedCorrelation( descriptor1, descriptor2 )
%GETNORMALIZEDCORRELATION Summary of this function goes here
%   Detailed explanation goes here
    measure = (descriptor1*descriptor2')/(norm(descriptor1)*norm(descriptor2));

end

