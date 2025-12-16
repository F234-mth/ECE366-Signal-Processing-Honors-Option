clc; clear; close all;
Fs   = 8192;
Length = 1000;% length for the tone
Gap = 100;% Gap
t    = (0:Length-1)/Fs;
digits_true = [3 3 5 9 4 5 7];
space = [];
for d = digits_true
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
    tone  = sin(2*pi*f1*t) + sin(2*pi*f2*t);
    space = [space tone zeros(1,Gap)];
end
P_sig  = mean(space.^2);
YdB    = 20;
sigma2 = P_sig / (10^(YdB/10));
noise  = sqrt(sigma2) * randn(size(space));
space_noisy = space + noise;

sound(space_noisy, Fs);

f_low  = [697 770 852 941];
f_high = [1209 1336 1477 1633];
keypad = [ 1  2  3 10;
           4  5  6 11;
           7  8  9 12;
          13  0 14 15];
Nd     = length(digits_true);
digits_est = zeros(1, Nd);

Nfft = 2048;
faxis = (0:Nfft/2-1)*Fs/Nfft;

for k = 1:Nd
    idx_start = (k-1)*(Length+Gap) + 1;
    idx_end   = idx_start + Length - 1;
    frame     = space_noisy(idx_start:idx_end);
    X    = fft(frame, Nfft);
    magX = abs(X(1:Nfft/2));
    row_energy = zeros(1,4);
    col_energy = zeros(1,4);
    for r = 1:4
        [~, idx] = min(abs(faxis - f_low(r)));
        row_energy(r) = magX(idx);
    end
    for c = 1:4
        [~, idx] = min(abs(faxis - f_high(c)));
        col_energy(c) = magX(idx);
    end
    [~, r_sel] = max(row_energy);
    [~, c_sel] = max(col_energy);
    digits_est(k) = keypad(r_sel, c_sel);
end
disp('Desired digits:');
disp(digits_true);
disp('Estimated digits:');
disp(digits_est);