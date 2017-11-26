close all;
clear all;

fs = 100;
Ts = 1/fs;
t = -5:Ts:5;
xt = rect_pulse(t);
yt = conv(xt,xt,'same')/fs;
figure;
subplot(2,1,1);
plot(t,xt);
subplot(2,1,2);
plot(t,yt);

x = (heaviside(2*t)).*heaviside(t);
y = conv(x,x,'same')/fs;
figure;
subplot(2,1,1);
plot(t,x);
subplot(2,1,2);
plot(t,y);
