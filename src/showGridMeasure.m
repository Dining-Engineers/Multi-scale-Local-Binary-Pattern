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

function [ I1 ] = showGridMeasure( image, region_rows, region_cols, measure_vector )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    I1 = image;

    if( length(measure_vector) == 1 )     
           I1 = writeStringKRegion( I1, region_rows, region_cols, measure_vector, num2str(measure_vector) );
    else

        for k=0:(region_rows*region_cols-1)

           I1 = writeStringKRegion( I1, region_rows, region_cols, k, num2str(measure_vector(k+1)) );

        end
    end
end
