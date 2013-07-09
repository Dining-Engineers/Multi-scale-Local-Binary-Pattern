function [ measure ] = getLogLikelihoodRatio( descriptor1, descriptor2 )
%GETLOGLIKELIHOODRATIO Summary of this function goes here
%   Detailed explanation goes here

    measure = - sum(descriptor1.*log(descriptor2));

end

