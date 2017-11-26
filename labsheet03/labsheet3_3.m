close all;
clear all;

%generation
t = linspace(0,0.01,1000000);
fc = 18000;
fm = 900;
fs = 80000;
Ac = 10;
Am = 4;
mt = Am*cos(2*pi*fm*t);
ct = Ac*cos(2*pi*fc*t);
[num, den] = butter(20,fc*2/fs);
st = ammod(mt,fc,fs,0,Ac);
mtnew = amdemod(st,fc,fs,0,Ac,num,den);

%plotting
subplot(3,1,1);
plot(t,mt,'linewidth',2);
xlabel('t')
ylabel('mt')
title('original message signal')

subplot(3,1,2);
plot(t,st,'linewidth',2);
xlabel('t')
ylabel('st')
title('modulated signal')

subplot(3,1,3);
plot(t,mtnew,'linewidth',2);
xlabel('t')
ylabel('st')
title('demodulated signal')