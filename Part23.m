clc; clear; close all;
Fs = 8192;
Nseg = 1000;
Nsil = 100;
t = (0:Nseg-1)/Fs;
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
figure;
plot((0:length(space)-1)/Fs, space);
xlabel('Time (s)');
ylabel('Amplitude');
title('DTMF Phone Number Signal');

sound(space, Fs);