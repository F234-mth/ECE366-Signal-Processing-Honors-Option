%A Part
[x, fs] = audioread('mp2_p2_original.wav');
x = x(:).';                
B = 1500;                  
N = 20001;                 
t_h = (-(N-1)/2:(N-1)/2)/fs;
h = sin(2*pi*B*t_h)./(pi*t_h);
h((N+1)/2) = 2*B;
t = (0:length(x)-1)/fs;
modulated = 2*x.*cos(2*pi*B*t);
y_full = conv(modulated, h);
mid = ceil(N/2);
y = y_full(mid:mid+length(x)-1);
idx = t <= 0.015;
figure;
plot(t(idx), y(idx));
xlabel('t (seconds)');
ylabel('y(t)');
title('First 15 ms of scrambled signal y(t)');
grid on;
soundsc(y, fs);
audiowrite('mp2_p3_scrambled.wav', y, fs);

%B Part
[Y, wY, fY] = ctft(y * fs, fs);
figure;
plot(fY, abs(Y));
xlabel('Frequency (Hz)');
ylabel('|Y(j\omega)|');
title('Magnitude of Y(j\omega) for scrambled signal y(t)');
grid on;
xlim([0 3000]);

%C Part
t = (0:length(y)-1)/fs;
modulated2 = 2*y(:).' .* cos(2*pi*B*t);
z_full = conv(modulated2, h);
Lz = length(y);
mid = ceil(N/2);
z = z_full(mid:mid+Lz-1);
idx = t <= 0.015;
figure;
plot(t(idx), z(idx));
xlabel('t (seconds)');
ylabel('z(t)');
title('First 15 ms of unscrambled signal z(t)');
grid on;
soundsc(z, fs);
audiowrite('mp2_p3_unscrambled.wav', z, fs);

%D Part
% Compute X(jw) 
[X, wX, fX] = ctft(x * fs, fs);
figure;
plot(fX, abs(X));
xlabel('Frequency (Hz)');
ylabel('|X(j\omega)|');
title('Magnitude of X(j\omega) for original signal x(t)');
grid on;
xlim([0 3000]);     

% Compute Z(jw)
[Z, wZ, fZ] = ctft(z * fs, fs);
figure;
plot(fZ, abs(Z));
xlabel('Frequency (Hz)');
ylabel('|Z(j\omega)|');
title('Magnitude of Z(j\omega) for unscrambled signal z(t)');
grid on;
xlim([0 3000]);