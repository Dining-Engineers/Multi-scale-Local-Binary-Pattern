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

I1 = (imread('grey_zebra.jpg'));  
I1= imread('grey_brick01.jpg');
figure;
imshow(I1);
region_rows = 3;
region_cols = 3;

for k=0:(region_rows*region_cols-1)
    
            [rMin, rMax, cMin, cMax] = gridBounds( size(I1), region_rows, region_cols, k);
            
            I1(rMin, : ) = 0;
            I1(rMax, : ) = 0;
            I1(:,cMin ) = 0;
            I1(:, cMax) = 0;
%                 k, rMin, rMax, cMin, cMax
%               [ k+1  ((rMax+rMin)/2) ((cMax+cMin)/2)]
%                 (rMax+rMin)/2
%                 (cMax+cMin)/2
            Text = sprintf(num2str(k+1));
            textColor =  [255 0 100];
            H = vision.TextInserter( Text ,'Color', textColor, 'FontSize', 24,...
                'Location', [floor((cMax+cMin)/2) floor((rMax+rMin)/2) ]);

            I1 = step(H, I1);
            
           

end

figure;
imshow(I1);
            
            
%                 
% I2 = im2double(imread('grey_zebra.jpg'));      
%             
% 
%     % Determine the dimensions of the input image.
%     % removing the border of the maximum radius 
%     xsize = size(I2, 1); 
%     ysize = size(I2, 2); 
%     region_xsize = floor(xsize/region_cols);
%     region_ysize = floor(ysize/region_rows);
% 
% 
%                     % counter for descriptor
%         counter = 1;
%         
%         % DIVIDO IN REGIONI
%         for j = 1:region_cols
%             for k = 1:region_rows
% 
% %                 if j == region_cols
% %                     endcol = size(lbp_image,1);
% %                 else
%                     endcol = j*region_xsize;
% %                 end
% %                 if k == region_rows
% %                     endrow = size(lbp_image,2);
% %                 else
%                     endrow = k*region_ysize;
% %                 end
% 
% rMin = (j-1)*region_xsize + 1;
% rMax = endcol;
% cMin=  (k-1)*region_ysize+1;
% cMax = endrow;
% 
%             I2(rMin, : ) = 0;
%             I2(rMax, : ) = 0;
%             I2(:,cMin ) = 0;
%             I2(:, cMax) = 0;
%              Text = sprintf(num2str(counter));
%             H = vision.TextInserter(Text);
%             H.Color = [1.0 0 0];
%             H.FontSize = 20;
%             H.Location = [(rMax+rMin)/2 (cMax+cMin)/2];
% 
%             I2 = step(H, I2);
%             
%                 counter = counter + 1;
%             end
%         end
%         
%         figure;
%             imshow(I2);