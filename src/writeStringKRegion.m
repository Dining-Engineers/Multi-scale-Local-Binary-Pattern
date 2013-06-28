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


function [ I1 ] = writeStringKRegion( I1, region_rows, region_cols, k, text )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    [rMin, rMax, cMin, cMax] = gridBounds( size(I1), region_rows, region_cols, k);

    % Grid color
    grid_color = 255;
    
    I1(rMin, : ) = grid_color;
    I1(rMax, : ) = grid_color;
    I1(:, cMin ) = grid_color;
    I1(:, cMax) = grid_color;

    Text = sprintf(text);
    textColor = [ 0, 0, 0];
    % 'Color', textColor, 
    H = vision.TextInserter( Text ,'Color', textColor, 'FontSize', 25, ...
        'Location', [floor((cMax+cMin)/2)-20 floor((rMax+rMin)/2) ]);

    I1 = step(H, I1);

end

