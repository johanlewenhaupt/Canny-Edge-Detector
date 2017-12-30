%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  function  img_blurred = blur_gauss( img, sigma )
%  purpose :    blur the image with gaussian filter kernel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  input   arguments
%     img:    grayscale input image, dimensions = m x n, (m = no. of rows, n = no. of columns)
%     sigma:  standard deviation of the gaussian kernel
%  output   arguments
%     img_blurred:     blurred image
%
%   Author: Johan Lewenhaupt
%   MatrNr: 1624242
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [img_blurred] = blur_gauss(img, sigma)
%  >>> ADD CODE HERE <<<
kernel_width = 2 * round(3 * sigma) + 1;
h = fspecial('gaussian', kernel_width, sigma);
img_blurred = imfilter(img, h);
end
