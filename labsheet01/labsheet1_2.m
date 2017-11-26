close all;
clear all;

Xk = [0 0 4 0];
xn = ifft(Xk)
xn = ifftshift(xn)
xrx = xcorr(xn)
stem(xrx);
norm(xn)