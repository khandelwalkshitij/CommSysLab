close all;
clear all;

fs = 100;
Ts = 1/fs;
t1 = -5:Ts:5;
x1 = rect_pulse1(t1);
t2 = -4:Ts:4;
x2 = rect_pulse2(t2);
y = conv(x1,x2)/fs;
t3 = -9:Ts:9;
plot(t3,y,'green',t2, x2,'red', t1,x1,'blue');