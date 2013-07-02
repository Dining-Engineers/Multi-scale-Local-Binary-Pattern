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

function [ I1, r_min, r_max, c_min, c_max ] = getGridMeasure( image, region_rows, region_cols )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    r_min = zeros(1,region_rows*region_cols);
    r_max = zeros(1,region_rows*region_cols);
    c_min = zeros(1,region_rows*region_cols);
    c_max = zeros(1,region_rows*region_cols);
    
    I1 = image;
    
    for k=0:(region_rows*region_cols-1)

        [ I1, r_min(k+1), r_max(k+1), c_min(k+1), c_max(k+1) ] = writeStringKRegion( I1, region_rows, region_cols, k);

    end

end
