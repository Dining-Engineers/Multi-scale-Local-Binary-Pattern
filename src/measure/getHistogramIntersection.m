function [ measure ] = getHistogramIntersection( descriptor1, descriptor2 )
%GETHISTOGRAMINTERSECTION Summary of this function goes here
%   Detailed explanation goes here
    
    measure = sum(min(descriptor1, descriptor2));

end

