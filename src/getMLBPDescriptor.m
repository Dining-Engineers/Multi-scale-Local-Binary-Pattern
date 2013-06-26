%GETMLBPDESCRIPTOR return a global descriptor of an image
%   DESCRIPTOR = GETMLBPDESCRIPTOR( IMAGE, MAPPING, R, REGION_ROWS, REGION_COLS )
%
%       IMAGE is an image
%       MAPPING is a map of values that encode the value of basic LBP
%       R is the max value of radius. Also represents the number of histograms for each region
%       REGION_ROWS * REGION_COLS is the number of regions


function [ descriptor ] = getMLBPDescriptor( image, mapping, lbp_radii, region_rows, region_cols )
% Version 0.1
% Authors: Andrea Rizzo and Matteo Bruni

    % define global descriptor
    % row = region
    % column = histograms at diffentent radius
    %
    % N.B.: descriptor count region in this order:
    %
    %   1   2   3
    %   4   5   6
    %   7   8   9
    
    hist_number = length(lbp_radii);
    
    descriptor = zeros(region_cols*region_rows, mapping.num*hist_number);
    
    % Determine the dimensions of the input image.
    % removing the border of the maximum radius 
    xsize = size(image, 1) - 2*lbp_radii(end); 
    ysize = size(image, 2) - 2*lbp_radii(end); 
    region_xsize = floor(xsize/region_cols);
    region_ysize = floor(ysize/region_rows);
    
    % Define an images vector
    % lbp_images = cell(hist_number,1);

    for i = lbp_radii
        
        % apply gauss smoothing with sigma = LBP radius
        myfilter = fspecial( 'gaussian', [3 3], i );
        image_smoothed = imfilter( image, myfilter, 'replicate' );

        % CALCOLA LBP RAGGIO I
        lbp_image = lbp( image_smoothed, i,8,mapping,'i' );
        
        % RITAGLIA IMMAGINE A DIMENSIONE MINORE (CROP)
        if (i ~= lbp_radii(end) )
            lbp_image = lbp_image(lbp_radii(end)-i+1:end-(lbp_radii(end)-i), lbp_radii(end)-i+1:end-(lbp_radii(end)-i));
        end

        % INSERISCI IN VETTORE IMMAGINI
        % lbp_images{i} = lbp_image;

       
    
        
        
        for k=0:(region_rows*region_cols-1)
            [rMin, rMax, cMin, cMax] = gridBounds( size(lbp_image), region_rows, region_cols, k);
            M = lbp_image(rMin:rMax, cMin:cMax );
            

            
            % compute histogram of subregion M
            h = hist(M(:),0:(mapping.num-1));
            % normalizie histogram
            h = h/sum(h);

            descriptor( k+1, ((i-1)*mapping.num)+1:i*mapping.num ) = h;

        end
        
        
         % counter for descriptor
        counter = 1;
        
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
%                 M = lbp_image( (j-1)*region_xsize+1:endcol, (k-1)*region_ysize+1:endrow );
% 
%                 % compute histogram of subregion M
%                 h = hist(M(:),0:(mapping.num-1));
%                 % normalizie histogram
%                 h = h/sum(h);
% 
%                 descriptor(counter, ((i-1)*mapping.num)+1:i*mapping.num) = h;
%                 counter = counter + 1;
%             end
%         end

    end

end

