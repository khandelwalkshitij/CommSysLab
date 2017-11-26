close all;
clear all;

%Quantizer Characteristic Curve

fm = 3;
fs = 30;
t = 0:0.01/fm:1;
Am = 2;
n = 3;
xt = Am*sin(2*pi*fm*t);
ts = 0:1/fs:1;
xs = Am*sin(2*pi*fm*ts);
L = 2^n;
Vmax = Am;
Vmin = -Am;
del = (Vmax - Vmin)/L;
steps = Vmin:del:Vmax;
quant = (Vmin - del/2):del:(Vmax + del/2);

%Quantizer
newquant = Vmin:del:(Vmax + del/2);
stairs(steps,newquant);
title('Quantizer Characteristic Curve');
xlabel('steps');
ylabel('Quant');