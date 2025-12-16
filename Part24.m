clc; clear; close all;
Fs = 8192;
x = 1000;%Global Attribute
Nsil = 100;
t = (0:x-1)/Fs;

digits = [3 3 5 9 4 5 7];

space = [];

for d = digits
    switch d
        case 0, f1 = 941; f2 = 1336;
        case 1, f1 = 697; f2 = 1209;
        case 2, f1 = 697; f2 = 1336;
        case 3, f1 = 697; f2 = 1477;
        case 4, f1 = 770; f2 = 1209;
        case 5, f1 = 770; f2 = 1336;
        case 6, f1 = 770; f2 = 1477;
        case 7, f1 = 852; f2 = 1209;
        case 8, f1 = 852; f2 = 1336;
        case 9, f1 = 852; f2 = 1477;
    end
    tone = sin(2*pi*f1*t) + sin(2*pi*f2*t);
    space = [space tone zeros(1,Nsil)];
end

P_sig = mean(space.^2);

YdB = 20;
sigma2 = P_sig / (10^(YdB/10));

noise = sqrt(sigma2) * randn(size(space));

space_noisy = space + noise;

figure;
subplot(2,1,1);
plot(space);
title('Original space vector');
subplot(2,1,2);
plot(space_noisy);
title(['space with SNR = ' num2str(YdB) ' dB']);

sound(space_noisy, Fs);