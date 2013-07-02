function [ measure ] = getClassifierFusion( descriptor1, descriptor2, type_measure )
%GETCLASSIFIERFUSION Summary of this function goes here
%   Detailed explanation goes here
    
    measure = 0;
    for i = 1:size(descriptor1,1)
        switch type_measure
            case 'ncorr'
                measure = measure + getNormalizedCorrelation( descriptor1(i,:), descriptor2(i,:) );
            case 'chisquare'
                measure = measure + getChiSquareCriterion( descriptor1(i,:), descriptor2(i,:) );
            case 'hinter'
                measure = measure + getHistogramIntersection( descriptor1(i,:), descriptor2(i,:) );
            case 'jsdiv'
                measure = measure + JSDiv( descriptor1(i,:), descriptor2(i,:) );
            otherwise
                error('Wrong measure type');
        end

    end

end

