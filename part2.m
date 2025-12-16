clc; clear; close all;

Fs = 8192;
T  = 1;
t  = 0:1/Fs:T-1/Fs;

f_low  = [697 770 852 941];
f_high = [1209 1336 1477 1633];

d0 = sin(2*pi*941*t)  + sin(2*pi*1336*t);
d1 = sin(2*pi*697*t)  + sin(2*pi*1209*t);
d2 = sin(2*pi*697*t)  + sin(2*pi*1336*t);
d3 = sin(2*pi*697*t)  + sin(2*pi*1477*t);
d4 = sin(2*pi*770*t)  + sin(2*pi*1209*t);
d5 = sin(2*pi*770*t)  + sin(2*pi*1336*t);
d6 = sin(2*pi*770*t)  + sin(2*pi*1477*t);
d7 = sin(2*pi*852*t)  + sin(2*pi*1209*t);
d8 = sin(2*pi*852*t)  + sin(2*pi*1336*t);
d9 = sin(2*pi*852*t)  + sin(2*pi*1477*t);

sound(d0, Fs); pause(1.2);
sound(d1, Fs); pause(1.2);
sound(d2, Fs); pause(1.2);
sound(d3, Fs); pause(1.2);
sound(d4, Fs); pause(1.2);
sound(d5, Fs); pause(1.2);
sound(d6, Fs); pause(1.2);
sound(d7, Fs); pause(1.2);
sound(d8, Fs); pause(1.2);
sound(d9, Fs); pause(1.2);

