clc; clear; close all;
load('lena512.mat');      
load('square.mat');       
load('cameraman.mat');  
img_list  = {lena512, A, camera512};
name_list = {'Lena', 'Square', 'Cameraman'};
box3 = ones(3,3) / 9;
box5 = ones(5,5) / 25;
box9 = ones(9,9) / 81;
gaus3 = gaussian_kernel(3, 0.8);
gaus5 = gaussian_kernel(5, 1.0);
gaus9 = gaussian_kernel(9, 1.5);
lap3 = [0 -1 0;
       -1 4 -1;
        0 -1 0];
for k = 1:numel(img_list)
    I = im2double(img_list{k});
    img_name = name_list{k};
    I_box3 = imfilter(I, box3, 'replicate');
    I_box5 = imfilter(I, box5, 'replicate');
    I_box9 = imfilter(I, box9, 'replicate');
    I_gaus3 = imfilter(I, gaus3, 'replicate');
    I_gaus5 = imfilter(I, gaus5, 'replicate');
    I_gaus9 = imfilter(I, gaus9, 'replicate');
    I_lap3 = imfilter(I, lap3, 'replicate');
    figure('Name',['Task 1.1.4 - ', img_name],'NumberTitle','off');

    subplot(3,4,1);
    imshow(I, []); title([img_name,' - Original']);

    subplot(3,4,2);
    imshow(I_box3, []); title('Box 3x3');

    subplot(3,4,3);
    imshow(I_box5, []); title('Box 5x5');

    subplot(3,4,4);
    imshow(I_box9, []); title('Box 9x9');

    subplot(3,4,6);
    imshow(I_gaus3, []); title('Gaussian 3x3');

    subplot(3,4,7);
    imshow(I_gaus5, []); title('Gaussian 5x5');

    subplot(3,4,8);
    imshow(I_gaus9, []); title('Gaussian 9x9');

    subplot(3,4,10);
    imshow(I_lap3, []); title('Laplacian 3x3');
   
end
%Debug By Chat GPT for the following code
function G = gaussian_kernel(sz, sigma)
    half = floor(sz/2);
    [x, y] = meshgrid(-half:half, -half:half);
    G = exp(-(x.^2 + y.^2) / (2*sigma^2));
    G = G / sum(G(:));
end