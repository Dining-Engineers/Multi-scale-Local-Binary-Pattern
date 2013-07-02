x = imread('C1R3EBQY.TIF');
imshow(x)
image(x)
axis image
grid on
%# grid domains
xg = 0:50:200;
yg = 0:50:200;
%# label coordinates
[xlbl, ylbl] = meshgrid(xg+25, yg+25);
%# create cell arrays of number labels
lbl = strtrim(cellstr(num2str((1:numel(xlbl))')));
text(xlbl(:), ylbl(:), lbl(:),'color','w',...
    'HorizontalAlignment','center','VerticalAlignment','middle');