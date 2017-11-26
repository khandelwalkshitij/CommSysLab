close all;
clear all;

fc = 50;
fs = 1000; %Reconstruction depends on sampling frequency. The larger the better.
fm = 200;
t1 = 0 : 1/fs : ( 2/fm - 1/fs );
x = 0.5 + 0.4*cos(2*pi*fm*t1);

[s,t2] = modulate(x,fc,fs,'ppm');
m1 = demod(s,fc,fs,'ppm');
subplot(3,1,1);
plot(t1,x);
xlabel('t');
ylabel('m(t)');
title('Message signal');
subplot(3,1,2);
plot(t2,s);
xlabel('t');
ylabel('s(t)');
title('PPM signal');
subplot(3,1,3);
plot(t1,m1);
xlabel('t');
ylabel('m_1(t)');
title('Reconstructed message signal');