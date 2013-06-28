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

function [ rMin, rMax, cMin, cMax ] = gridBounds( imgSize, numGridRows, numGridCols, k )
%GRIDBOUNDS Summary of this function goes here
%   Detailed explanation goes here
    
% k ranges from 0 to (numGridRows*numGridCols-1)

deltaRows=uint16(floor(single(imgSize(1,1))/single(numGridRows)));
deltaCols=uint16(floor(single(imgSize(1,2))/single(numGridCols)));

gridColIndex=mod(k, numGridCols);
gridRowIndex=floor(single(k)/single(numGridCols));

% WARNING:  gridColIndex takes values in {0,..., numGridCols-1}
%           gridRowIndex takes values in {0,..., numGridRows-1}

rMin=1+uint16(deltaRows)*uint16(gridRowIndex);
rMax=rMin+deltaRows-1;
cMin=1+uint16(deltaCols)*uint16(gridColIndex);
cMax=cMin+deltaCols-1;

end

