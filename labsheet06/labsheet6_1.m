close all;
clear all;

fc = 4000;
fs = 80000; %Reconstruction depends on sampling frequency. The larger the better.
fm = 900;
t1 = linspace(0, 4, 900);
x = 0.5 + 0.5*sin(2*pi*fm*t1);
[s,t2] = modulate(x,fc,fs,'pwm','centered');
m1 = demod(s,fc,fs,'pwm','centered');
subplot(3,1,1);
plot(t1,x);
axis([0 2 -1.2 1.2]);
xlabel('t');
ylabel('m(t)');
title('Message signal');
subplot(3,1,2);
plot(t2,s);
xlabel('t');
ylabel('s(t)');
title('PWM signal');
axis([0 .004 -0.2 1.2]);
subplot(3,1,3);
plot(t1,m1);
axis([0 2 -1.2 1.2]);
xlabel('t');
ylabel('m_1(t)');
title('Reconstructed message signal');