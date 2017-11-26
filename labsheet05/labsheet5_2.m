close all;
clear all;

fs = 1000;
Ts = 1/1000;
t = 0:Ts:0.02;
f1 = 125;
x = cos(2*pi*f1*t);

n = 0:20; %t/Ts is the number of values in t. That number is 20.
xn = cos(pi*n/4);

%Add 10 previous and 20 later samples. So it goes from 0:20 to -10:40
n2 = -10:40;
xn2 = cos(pi*n2/4);

xr = zeros(1,1000);
tnew = linspace(-0.01,0.04,1000); %This changed because we are taking extra samples before and after for reconstruction.

%Reconstruction using sinc
for k = 1:1000;
    for m = -10:40;
        xr(k) = xr(k) + xn2(m+11)*sinc(tnew(k)*fs - m);
    end
end

subplot(3,1,1);
plot(t,x);
xlabel('time');
ylabel('amplitude');
title('original signal');

subplot(3,1,2);
stem(n,xn);
xlabel('n');
ylabel('amplitude');
title('sampled signal');

subplot(3,1,3);
plot(tnew,xr);
xlabel('time');
ylabel('amplitude');
title('reconstructed signal');