clc; clear; close all;

load('touch.mat');

Fs = 8192;

digits_x1 = ttdecode(x1);
digits_x2 = ttdecode(x2);

disp('Digits for x1:');
disp(digits_x1);

disp('Digits for x2:');
disp(digits_x2);

sound(x1, Fs);
pause(length(x1)/Fs + 0.5);
sound(x2, Fs);