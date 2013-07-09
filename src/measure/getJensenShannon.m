function [ measure ] = getJensenShannon( descriptor1, descriptor2 )
%GETLOGLIKELIHOODRATIO Summary of this function goes here
%   Detailed explanation goes here

    t = 0.5*( descriptor1 + descriptor2 );
    measure = - sum( descriptor1.*log(descriptor1) + descriptor2.*log(descriptor2) - 2*( t.*log(t) ) );

end

