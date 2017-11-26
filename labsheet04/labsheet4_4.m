close all;
clear all;

fs = 40000;
fc = 10000;
fm = 500;
freqdev = 2500;
t = linspace(0,0.004,100000);
m = 3*cos(2*pi*fm*t);
s = fmmod(m,fc,fs,freqdev,-pi/2);
md = fmdemod(s,fc,fs,freqdev);

subplot(2,1,1);
plot(t,m);
xlabel('t');
ylabel('Amplitude');
title('Original Signal');

subplot(2,1,2);
plot(t,md);
xlabel('t');
ylabel('Amplitude');
title('Demodulated Signal');