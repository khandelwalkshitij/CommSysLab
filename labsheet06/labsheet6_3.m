close all;
clear all;

fc = 8000;
fs = 80000; %Reconstruction depends on sampling frequency. The larger the better.
fm = 400;
t1 = linspace(0, 4, 800);
x = 0.5 + 0.5*sin(2*pi*fm*t1);

[s,t2] = modulate(x,fc,fs,'ppm');
subplot(2,1,1);
plot(t1,x);
axis([0 4 -.2 1.2]);
xlabel('t');
ylabel('m(t)');
title('Message signal');
subplot(2,1,2);
plot(t2,s);
xlabel('t');
ylabel('s(t)');
title('PPM signal');
axis([0 .004 -0.2 1.2]);