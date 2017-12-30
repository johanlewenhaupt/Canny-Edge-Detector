 clear all; close all;
%runfile

%% new
vid = VideoReader('left-right.mp4');
nFrames = vid.NumberOfFrames;
startFrame = 1;
step = 1;

im = read(vid,step);
%%

img_color = im; %img_color = imread('drums.png');
img = rgb2gray(img_color); img = im2double(img);

%% 1. Blur Image
sigma = 1.8;

[blurred] = blur_gauss(img, sigma);

figure, imshow(blurred), title('Blurred grayscale picture');
%% 2. Detect Edge
[gradient, orientation] = sobel(blurred);

figure, imshow(gradient), title('gradient');
figure, imshow(orientation,[]), title('orientation');
%% 3. Non-maxima Surpression
[edges] = non_max(gradient, orientation);

figure, imshow(edges), title('Non-maxima');
%% 4. Hysteris Threshold
thresh_low = 0.03;	% <<< change value
thresh_high = 1.2;  % <<< change value

canny_edges = hyst_thres(edges, thresh_low, thresh_high);

figure, imshow(canny_edges,[]), title('Hysteris Threshold');