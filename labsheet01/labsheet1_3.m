close all;
clear all;

t = -6.28:0.01:6.28;
y1 = cos(t);
y2 = hilbert(y1);
figure;
plot(t,y1);
hold on;
plot(t,imag(y2));
dn = [1 1 -1 -1];
anal = hilbert(dn)
analreal = real(anal)
analimag = imag(anal)
dotp = dot(dn,analimag)