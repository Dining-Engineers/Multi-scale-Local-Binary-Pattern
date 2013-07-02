function [ measure ] = getChiSquareCriterion( descriptor1, descriptor2 )
%GETCHISQUARECRITERION Summary of this function goes here
%   Detailed explanation goes here

    measure = - sum( ((descriptor1-descriptor2).^2)./(descriptor1+descriptor2) );

end

