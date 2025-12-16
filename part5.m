clc; clear; close all;
load('lena512.mat');      % variable: lena512
load('cameraman.mat');    % variable: camera512
I_L = im2double(lena512);
I_C = im2double(camera512);
F_L = fft2(I_L);
F_C = fft2(I_C);
L_mag = abs(F_L);
C_mag = abs(F_C);
L_phase = angle(F_L);
C_phase = angle(F_C);
F_LC = L_mag .* exp(1j * C_phase);

% Cameraman magnitude + Lena phase
F_CL = C_mag .* exp(1j * L_phase);

I_LC = real(ifft2(F_LC));
I_CL = real(ifft2(F_CL));
figure;
subplot(2,2,1);
imshow(I_L, []);
title('Original Lena');
subplot(2,2,2);
imshow(I_C, []);
title('Original Cameraman');
subplot(2,2,3);
imshow(I_LC, []);
title('Mag(Lena) + Phase(Cameraman)');
subplot(2,2,4);
imshow(I_CL, []);
title('Mag(Cameraman) + Phase(Lena)');
