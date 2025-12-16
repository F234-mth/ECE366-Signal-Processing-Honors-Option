clc; clear; close all;

Fs = 8192;
T  = 1;
t  = 0:1/Fs:T-1/Fs;

d2 = sin(2*pi*697*t)  + sin(2*pi*1336*t);
d9 = sin(2*pi*852*t)  + sin(2*pi*1477*t);

N = 2048;
x2 = d2(1:N);
x9 = d9(1:N);

X2 = fft(x2, N);
X9 = fft(x9, N);

X2s = fftshift(X2);
X9s = fftshift(X9);

omega = linspace(-pi, pi, N);

figure;
subplot(2,2,1);
plot(omega, abs(X2s));
xlabel('\omega'); ylabel('|X_2(j\omega)|');
title('Digit 2 Magnitude');

subplot(2,2,2);
plot(omega, abs(X2s).^2);
xlabel('\omega'); ylabel('|X_2(j\omega)|^2');
title('Digit 2 Magnitude Squared');

subplot(2,2,3);
plot(omega, abs(X9s));
xlabel('\omega'); ylabel('|X_9(j\omega)|');
title('Digit 9 Magnitude');

subplot(2,2,4);
plot(omega, abs(X9s).^2);
xlabel('\omega'); ylabel('|X_9(j\omega)|^2');
title('Digit 9 Magnitude Squared');