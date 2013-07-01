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

function [ rgbImage ] = writeResults( I1, region_rows, region_cols, correct_regions, rejected )
%WRITERESULTS Summary of this function goes here
%   Detailed explanation goes here

    rgbImage = repmat(I1,[1 1 3]);
    rgbImage = cat(3,I1,I1,I1);
    size(rgbImage)

    for k=0:(region_rows*region_cols-1)

        [rMin, rMax, cMin, cMax] = gridBounds( size(rgbImage), region_rows, region_cols, k);
        
        if any( k == correct_regions ) 
           grid_color = [0 0 255];
        elseif any( k == rejected ) 
           grid_color = [255 0 0];
        else
           grid_color = [0 255 0];
        end
        % Grid color

        rgbImage(rMin, cMin:cMax , 1) = grid_color(1);
        rgbImage(rMin, cMin:cMax , 2) = grid_color(2);
        rgbImage(rMin, cMin:cMax , 3) = grid_color(3);
        
        rgbImage(rMax, cMin:cMax , 1) = grid_color(1);
        rgbImage(rMax, cMin:cMax , 2) = grid_color(2);
        rgbImage(rMax, cMin:cMax , 3) = grid_color(3);

        rgbImage(rMin:rMax, cMin , 1) = grid_color(1);
        rgbImage(rMin:rMax, cMin , 2) = grid_color(2);
        rgbImage(rMin:rMax, cMin , 3) = grid_color(3);
        
        rgbImage(rMin:rMax, cMax , 1) = grid_color(1);
        rgbImage(rMin:rMax, cMax , 2) = grid_color(2);
        rgbImage(rMin:rMax, cMax , 3) = grid_color(3);

        % Text = num2str(k);
        % textColor = [ 0, 0, 0];
        % 'Color', textColor, 
        % H = vision.TextInserter( Text ,'Color', textColor, 'FontSize', 25, ...
%            'Location', [floor((cMax+cMin)/2)-20 floor((rMax+rMin)/2) ]);

        % rgbImage = step(H, rgbImage);
    end
    

    
    

end


