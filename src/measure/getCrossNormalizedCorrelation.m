function [ measure ] = getCrossNormalizedCorrelation( descriptor1, descriptor2 )
%GETNORMALIZEDCORRELATION Summary of this function goes here
%   Detailed explanation goes here
    
%     num = ( ( descriptor1 - mean2(descriptor1) ) * ( descriptor2 - mean2(descriptor2) )' );
%     den = sqrt( sum((descriptor1 - mean2(descriptor1) ).^2 ) * sum(( descriptor2 - mean2(descriptor2) ).^2  ));
%     
%     measure = num/den;
    
    num = cov(descriptor1,descriptor2);
    
    measure = num(1,2)/(std(descriptor1)*std(descriptor2));

end

