close all;
clear all;

tau = 1;
t = -5:0.01:5;
h = exp(-t/tau).*heaviside(t);

f = fft(h);
f1 = fftshift(f);

subplot(3,1,1);
plot(t,h,'k');
title('Time Domain');

subplot(3,1,2);
plot(abs(f),'r');
title('Frequency Domain');

subplot(3,1,3);
x=length(f);
x=floor(x/2);
w = -1*x:1:x;
plot(w,abs(f1),'b')
title('Shifted frequency');