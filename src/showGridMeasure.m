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
