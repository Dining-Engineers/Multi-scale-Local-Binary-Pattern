function [ I1 ] = writeStringKRegion( I1, region_rows, region_cols, k, text )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    [rMin, rMax, cMin, cMax] = gridBounds( size(I1), region_rows, region_cols, k);

    I1(rMin, : ) = 0;
    I1(rMax, : ) = 0;
    I1(:, cMin ) = 0;
    I1(:, cMax) = 0;

    Text = sprintf(text);
    % textColor = [255 0 0];
    % 'Color', textColor, 
    H = vision.TextInserter( Text ,'FontSize', 30,...
        'Location', [floor((cMax+cMin)/2) floor((rMax+rMin)/2) ]);

    I1 = step(H, I1);

end

