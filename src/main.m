
% get the image
I=imread('grey_brick01.jpg');

% map the value to uniform implementation
mapping=getmapping(8,'u2');

% number of lbp/histogram 
hist_number = 4;

% define region rows and columns
% an histogram for each region will be calculated
region_rows = 3;
region_cols = 3;

% Determine the dimensions of the input image.
ysize = size(I,1) - 2*hist_number; 
xsize = size(I,2) - 2*hist_number; 
region_ysize = round(ysize/region_rows);
region_xsize = round(xsize/region_cols);
    

% DEFINISCI VETTORE DI IMMAGINI LBP
lbp_images = cell(hist_number,1);

for i = 1:hist_number
    
    % CALCOLA LBP RAGGIO I
    lbp_image = lbp(I,i,8,mapping,'i');


    % RITAGLIA IMMAGINE A DIMENSIONE MINORE (CROP)
    if (i ~= hist_number)
        lbp_image = lbp_image(hist_number-i+1:end-(hist_number-i), hist_number-i+1:end-(hist_number-i));
    end
    

    % INSERISCI IN VETTORE IMMAGINI
    lbp_images{i} = lbp_image;
    

    % DIVIDO IN REGIONI
    for j = 1:region_rows
        for k = 1:region_cols
            if j == region_rows*region_cols
                M = lbp_image((j-1)*region_ysize+1:end, (k-1)*region_xsize+1:end);
            else
                M = lbp_image((j-1)*region_ysize+1:j*region_ysize, (k-1)*region_xsize+1:k*region_xsize);
            end
        end
    end
    
    % PER OGNI REGIONE CALCOLA HIST
    
    
    % CONCATENA HIST IN DESCRITTORE GLOBALEEE


end


% DEFINISCI SOTTOREGIONI (DA M0 a Mj-1)

% CALCOLA REGIONAL PATTERN




% descriptor = zeros(1,mapping.num*hist_number);
% 
%     h = lbp(I,i,8,mapping,'nh');
% 
% 
% descriptor(((i-1)*mapping.num)+1:i*mapping.num) = h;