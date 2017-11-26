close all;
clear all;

%Pulse Amplitude Modulation
Ac = 2;
Am = 4;
fc = 10000;
fm = 200;
ka = 0.09;
cn = [0 0 1 1 1 1 0 0];
m = fc/fm;
t = linspace(0,4,m*length(cn));
x = Am*sin(2*pi*fm*t);
cnx = repmat(cn,1,m);
y = Ac*(1+ka*x).*cnx;

subplot(3,1,1);
plot(t,x);
xlabel('time');
ylabel('amplitude');
title('message signal');
subplot(3,1,2);
plot(t,cnx);

xlabel('time');
ylabel('amplitude');
title('carrier signal');
subplot(3,1,3);
plot(t,y);

xlabel('time');
ylabel('amplitude');
title('PAM Signal');

maximum = max(y);
minimum = min(y(y>0));
r = maximum/minimum;
ratio_in_dB = 20*log10(r)