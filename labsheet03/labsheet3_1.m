close all
clear all;

t = linspace(0,0.01,1000000);
fc = 18000;
fm = 900;
Ac = 10;
Am = 4;

mt = Am*cos(2*pi*fm*t);
ct = Ac*cos(2*pi*fc*t);
modulation_index = Am/Ac;
st = (1+modulation_index*mt).*ct;

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


%R = 1 ohm
%Pc = Ac^2 /(2R)
%Thus, Pc = 100/2 = 50 W
%Pt = Pc*[1+(mu)^2 /2]
%Thus, Pt = 54 W
%Thus, Power in Sidebands = Pt – Pc = 4W
%2W in USB and 2W in LSB.
% Power Efficiency = mu^2 /(2+mu^2 ) = 7.41%
%BW = 2*fm = 1800 Hz = 1.8 KHz
