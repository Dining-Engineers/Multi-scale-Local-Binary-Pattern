
% 


% get the image
I=imread('grey_zebra.jpg');%'grey_brick01.jpg');

% map the value to uniform implementation
mapping=getmapping(8,'u2');

% number of lbp/histogram 
hist_number = 3;%4;

% define region rows and columns
% an histogram for each region will be calculated
region_rows = 3;
region_cols = 3;

descriptor1 = getMLBPDescriptor( I, mapping, hist_number, region_rows, region_cols );
%descriptor2 = getMLBPDescriptor( I, mapping, hist_number, region_rows, region_cols );







% % Determine the dimensions of the input image.
% xsize = size(I,1) - 2*hist_number; 
% ysize = size(I,2) - 2*hist_number; 
% region_xsize = round(xsize/region_cols);
% region_ysize = round(ysize/region_rows);
% 
% % define global descriptor
% % row = region
% % column = histograms at diffentent radius
% % NB descriptor count region in this order:
% %
% %   3   6   9
% %   2   5   8
% %   1   4   7
% %
% descriptor = zeros(region_cols*region_rows,mapping.num*hist_number);
% 
% % DEFINISCI VETTORE DI IMMAGINI LBP
% lbp_images = cell(hist_number,1);
% 
% 
% % counter for descriptor
% counter = 1;
% 
% for i = 1:hist_number
%     
%     % CALCOLA LBP RAGGIO I
%     lbp_image = lbp(I,i,8,mapping,'i');
% 
%     % RITAGLIA IMMAGINE A DIMENSIONE MINORE (CROP)
%     if (i ~= hist_number)
%         lbp_image = lbp_image(hist_number-i+1:end-(hist_number-i), hist_number-i+1:end-(hist_number-i));
%     end
%     
% 
%     % INSERISCI IN VETTORE IMMAGINI
%     lbp_images{i} = lbp_image;
%     
%     
%     % DIVIDO IN REGIONI
%     for j = 1:region_cols
%         for k = 1:region_rows
%                 
%             if j == region_cols
%                 endcol = size(lbp_image,1);
%             else
%                 endcol = j*region_xsize;
%             end
%             if k == region_rows
%                 endrow = size(lbp_image,2);
%             else
%                 endrow = k*region_ysize;
%             end
%                 
%             M = lbp_image((j-1)*region_xsize+1:endcol, (k-1)*region_ysize+1:endrow);
%            
%             % compute histogram of subregion M
%             h = hist(M(:),0:(mapping.num-1));
%             % normalizie histogram
%             h = h/sum(h);
%             
%             descriptor(counter, ((i-1)*mapping.num)+1:i*mapping.num) = h;
%             counter = counter + 1;
%         end
%     end
% 
% end


% CALCOLA REGIONAL PATTERN




% descriptor = zeros(1,mapping.num*hist_number);
% 
%     h = lbp(I,i,8,mapping,'nh');
% 
% 
% descriptor(((i-1)*mapping.num)+1:i*mapping.num) = h;