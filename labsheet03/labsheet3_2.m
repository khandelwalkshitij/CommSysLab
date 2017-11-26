close all;
clear all;

%generation
t = linspace(0,0.01,1000000);
fc = 18000;
fm = 900;
fs = 37000;
Ac = 10;
Am = 4;
mt = Am*cos(2*pi*fm*t);
ct = Ac*cos(2*pi*fc*t);
st = ammod(mt,fc,fs,0,Ac);

%plotting
subplot(3,1,1);
plot(t,mt,'linewidth',2);
xlabel('t')
ylabel('mt')
title('message signal')

subplot(3,1,2);
plot(t,ct,'linewidth',2);
xlabel('t')
ylabel('ct')
title('carrier signal')

subplot(3,1,3);
plot(t,st,'linewidth',2);
xlabel('t')
ylabel('st')
title('modulated signal')