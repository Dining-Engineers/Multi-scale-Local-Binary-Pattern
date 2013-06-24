function [ measure ] = getClassifierFusion( descriptor1, descriptor2 )
%GETCLASSIFIERFUSION Summary of this function goes here
%   Detailed explanation goes here
    
    measure = 0;
    for i = 1:size(descriptor1,1)
       measure = measure + getNormalizedCorrelation( descriptor1(i,:), descriptor2(i,:));
       %measure = measure + getChiSquareCriterion( descriptor1(i,:), descriptor2(i,:));
       %measure = measure + getHistogramIntersection( descriptor1(i,:), descriptor2(i,:));

    end

end

