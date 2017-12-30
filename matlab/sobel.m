%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  function  [gradient, orientation] = sobel( I )
%  purpose :    computed the gradient and the orientation of an image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input   arguments
%     I:    grayscale input image, dimensions = m x n, (m = no. of rows, n = no. of columns)
%  output   arguments
%     gradient:     gradients image
%     orientation:  orientation image
%   Author: Johan Lewenhaupt
%   MatrNr: 1624242
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [gradient, orientation] = sobel(I)
%  >>> ADD CODE HERE <<<
h_vertical = -fspecial('sobel')';
h_horizontal = h_vertical';
Img_horizontal = imfilter(I,h_horizontal);
Img_vertical = imfilter(I,h_vertical);
[row,col] = size(I);
Img = zeros(row,col);
for r = 1:row
    for c = 1:col
        Img(r,c) = sqrt(Img_horizontal(r,c)^2 + Img_vertical(r,c)^2);
    end
end

Img_direction = atan2(Img_horizontal,Img_vertical);

gradient = Img;
orientation = Img_direction;
end