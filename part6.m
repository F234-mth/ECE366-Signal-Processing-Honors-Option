clc; clear; close all;
load('noisy_image.mat'); 
I = im2double(noisy_image);
figure;
imagesc(I); 
colormap(gray);
axis image off;
title('Noisy Image');

F = fft2(I);
F_shift = fftshift(F);
magF = abs(F_shift);
phaseF = angle(F_shift);
figure;
subplot(1,2,1);
imagesc(log(1 + magF));
colormap(gray);
axis image off;
title('Magnitude Spectrum');
subplot(1,2,2);
imagesc(phaseF);
colormap(gray);
axis image off;
title('Phase Spectrum');















