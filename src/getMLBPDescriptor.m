%GETMLBPDESCRIPTOR return a global descriptor of an image
%   DESCRIPTOR = GETMLBPDESCRIPTOR( IMAGE, MAPPING, R, REGION_ROWS, REGION_COLS )
%
%       IMAGE is an image
%       MAPPING is a map of values that encode the value of basic LBP
%       R is the max value of radius. Also represents the number of histograms for each region
%       REGION_ROWS * REGION_COLS is the number of regions


function [ descriptor ] = getMLBPDescriptor( image, mapping, R, region_rows, region_cols )
% Version 0.1
% Authors: Andrea Rizzo and Matteo Bruni

    % define global descriptor
    % row = region
    % column = histograms at diffentent radius
    % NB descriptor count region in this order:
    %
    %   3   6   9
    %   2   5   8
    %   1   4   7
    
    hist_number = R;
    
    descriptor = zeros(region_cols*region_rows,mapping.num*hist_number);
    
    % Determine the dimensions of the input image.
    xsize = size(image, 1) - 2*R; 
    ysize = size(image, 2) - 2*R; 
    region_xsize = round(xsize/region_cols);
    region_ysize = round(ysize/region_rows);
    
    % Define an images vector
    lbp_images = cell(hist_number,1);

    

    for i = 1:hist_number

        % CALCOLA LBP RAGGIO I
        lbp_image = lbp(image,i,8,mapping,'i');

        % RITAGLIA IMMAGINE A DIMENSIONE MINORE (CROP)
        if (i ~= hist_number)
            lbp_image = lbp_image(hist_number-i+1:end-(hist_number-i), hist_number-i+1:end-(hist_number-i));
        end

        % INSERISCI IN VETTORE IMMAGINI
        lbp_images{i} = lbp_image;

        % counter for descriptor
        counter = 1;
    
        % DIVIDO IN REGIONI
        for j = 1:region_cols
            for k = 1:region_rows

                if j == region_cols
                    endcol = size(lbp_image,1);
                else
                    endcol = j*region_xsize;
                end
                if k == region_rows
                    endrow = size(lbp_image,2);
                else
                    endrow = k*region_ysize;
                end

                M = lbp_image((j-1)*region_xsize+1:endcol, (k-1)*region_ysize+1:endrow);

                % compute histogram of subregion M
                h = hist(M(:),0:(mapping.num-1));
                % normalizie histogram
                h = h/sum(h);

                descriptor(counter, ((i-1)*mapping.num)+1:i*mapping.num) = h;
                counter = counter + 1;
            end
        end

    end

end

