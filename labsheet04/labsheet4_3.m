close all;
clear all;

t=linspace(0,0.004,100000);
m = 3*cos(2*pi*500*t);
s = 10*cos(2*pi*10000*t + 5*sin(2*pi*500*t)-pi/2);
c = 10*sin(2*pi*10000*t);
mi=5;

subplot(3,1,1);
plot(t,m);
xlabel('t');
ylabel('m(t)');
title('Message Signal');
subplot(3,1,2);
plot(t,c);
xlabel('t');
ylabel('c(t)');
title('Carrier Signal');
subplot(3,1,3);
plot(t,s);
xlabel('t');
ylabel('s(t)');
title('Frequency Modulated Signal');

Modulation_Index= mi
fm=500;
Ac=10;
Frequency_Deviation = mi*fm
TransmitPower=(Ac*Ac/2)
Bandwidth=(2*(mi+1)*fm)