%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  function  edges = non_max( gradients, orientations )
%  purpose: computes a non-maxima suppresion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input arguments
%     gradients:    gradient image, dimensions = m x n, (m = no. of rows, n = no. of columns)
%     orientations: orientation image, dimensions = m x n, (m = no. of rows,
%                                                           n = no. of columns)
%  output arguments
%     edges:     edge image
%
%   Author: Johan Lewenhaupt
%   MatrNr: 1624242
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [edges] = non_max(gradient, ori)
% >>> ADD CODE HERE <<<
[row,col] = size(gradient);
edges = gradient;
for r = 2:(row-1)
    for c = 2:(col-1)
        tangent = ori(r,c);
        %for horizontal gradient:
        if abs(tangent)<=(pi/8) || abs(tangent)> (7*pi/8)
            if gradient(r,c-1) > gradient(r,c) || gradient(r,c+1) > gradient(r,c)
                edges(r,c)=0;
            end
        end
        %for vertical gradient:
        if abs(tangent)<=(5*pi/8) && abs(tangent)>(3*pi/8)
            if gradient(r-1,c) > gradient(r,c) || gradient(r+1,c) > gradient(r,c)
                edges(r,c)=0;
            end
        end
        %for diagonal, top left and bottom right
        if abs(tangent)<=(7*pi/8) && abs(tangent)>(5*pi/8)
            if gradient(r-1,c-1) > gradient(r,c) || gradient(r+1,c+1) > gradient(r,c)
                edges(r,c)=0;
            end
        end
        %for diagonal, bottom left and top right
        if abs(tangent)<=(3*pi/8) && abs(tangent)>(pi/8)
            if gradient(r+1,c-1) > gradient(r,c) || gradient(r-1,c+1) > gradient(r,c)
                edges(r,c)=0;
            end
        end
    end
end
end
