%GETMLBPDESCRIPTOR return a global descriptor of an image
%   DESCRIPTOR = GETMLBPDESCRIPTOR( IMAGE, MAPPING, RADII, REGION_ROWS, REGION_COLS )
%
%       IMAGE is an image
%       MAPPING is a map of values that encode the value of basic LBP
%       RADII is a vector of radius. length(RADII) represents the number of histograms for each region
%       REGION_ROWS * REGION_COLS is the number of regions

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


function [ descriptor ] = getMLBPDescriptor( image, mapping, radii, num_region_rows, num_region_cols, sigma_coefficient )
% Version 0.1
% Authors: Andrea Rizzo and Matteo Bruni

    % define global descriptor
    % descriptor's rows are the local descriptors of regions
    % descriptor's column are the bins of histograms at diffentent radius
    %
    % N.B.: descriptor count region in this order:
    %
    %   _ _ _ _ _ _ 
    %  |_1_|_2_|_3_|
    %  |_4_|_5_|_6_|
    %  |_7_|_8_|_9_|
    %

    %represents the number of histograms for each region
    hist_number = length(radii);
    
    % initialization of global descriptor
    descriptor = zeros( num_region_cols*num_region_rows, mapping.num*hist_number );
 
    % compute kernel size
    % 6*sigma - 1 = kernel_size
    %
        
    kernel_size = ceil( abs( 6*sigma_coefficient - 1 ) );

    for i = radii
        
        % apply gauss smoothing with sigma = LBP radius
        myfilter = fspecial( 'gaussian', kernel_size, sigma_coefficient );
        image = imfilter( image, myfilter, 'replicate' );
        
        % CALCOLA LBP RAGGIO I
        lbp_image = lbp( image, i, 8, mapping, 'i' );
        
        % RITAGLIA IMMAGINE A DIMENSIONE MINORE (CROP)
        if (i ~= radii(end) )
            lbp_image = lbp_image( radii(end)-i+1:end-(radii(end)-i), radii(end)-i+1:end-(radii(end)-i) );
        end
                
        for k = 0:( num_region_rows*num_region_cols - 1 )
            [rMin, rMax, cMin, cMax] = gridBounds( size(lbp_image), num_region_rows, num_region_cols, k );
            M = lbp_image(rMin:rMax, cMin:cMax );

            % compute histogram of subregion M
            h = hist(M(:),0:(mapping.num-1));
            % normalizie histogram
            h = h/sum(h);
            
            descriptor( k+1, ((i-1)*mapping.num)+1:i*mapping.num ) = h;

        end
        
    end

end