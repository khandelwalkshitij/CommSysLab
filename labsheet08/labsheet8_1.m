close all;
clear all;

Am = 1;
Ts = 0.045;
t = 0:Ts:9;
mt = Am*sin(t);
delta = Ts;
mq = zeros(1,length(t)-1);
b = zeros(1,length(t)-1);

%Delta Modulation
for i = 1:(length(t)-1)
    if mq(1,i) <= mt(1,i)
        b(1,i) = 1;
        mq(1,i+1) = mq(1,i) + delta;
    else
        b(1,i) = 0;
        mq(1,i+1) = mq(1,i) - delta;
    end
end

%Difference Signal
d = abs(mt - mq);

%plot
%message signal
plot(t,mt,'red');
hold on;
%modulated signal
stairs(t,mq);
hold on;
%demodulated signal
plot(t,mq,'cyan');
hold on;
%difference signal
plot(t,d,'green');
hold off;

%plot window
title('Delta Modulation');
xlabel('time');
ylabel('magnitude');
legend('Message Signal','Modulated Signal','Demodulated Signal','Difference Signal','location','best');

dsq = d.*d;
se = sum(dsq);

square_error = se
bit_duration = Ts
bit_rate = 1/Ts