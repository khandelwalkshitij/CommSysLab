close all;
clear all;

t = 0 : 0.001 : 1;
c = sawtooth(20*pi*t);
m = 0.45*sin(2*pi*t);
s = zeros(1,length(t));

for n = 1: length(t)
    if (c(n) >= m(n))
        s(n) = 1;
    end
end

subplot(2,1,1);
plot(t,c);
hold on 
plot(t,m)
axis([0 1 -1.5 1.5]);
xlabel('t');
ylabel('c(t),m(t)');
title('Message and Sawtooth signal');
legend('Sawtooth signal','Message signal');
subplot(2,1,2);
plot(t,s);
axis([0 1 -1.5 1.5]);
xlabel('t');
ylabel('s(t)');
title('PWM signal');
    