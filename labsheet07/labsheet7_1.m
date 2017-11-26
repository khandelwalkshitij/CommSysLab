close all;
clear all;

%Uniform PCM
fm = 3;
fs = 30;
t = 0:0.01/fs:1; %Wannabe Continuous :P
Am = 2;
n = 3; %Number of bits
x = Am*sin(2*pi*fm*t);
ts = 0:1/fs:1;
xs = Am*sin(2*pi*fm*ts); %Sampled Signal
L = 2^n; %Quantization Levels = 2^n = 8
Vmax = Am;
Vmin = -Am;
del = (Vmax - Vmin)/L; %Step Size
steps = Vmin: del: Vmax;
quant = (Vmin - del/2):del:(Vmax + del/2); %Codebook

%Calculations
[indx,qv] = quantiz(xs,steps,quant);
indx = indx - 1; % Because zero is also considered
val = de2bi(indx,'left-msb'); %Decimal to binary

%This part is to convert matrix to a single vector
leng = size(val,1)*size(val,2);
val = val.';
e = reshape(val,1,leng);
xe = 0:1/(leng-1):1; %x-axis For plotting the signal

%Plotting
subplot(4,1,1);
plot(t,x);
xlabel('Time');
ylabel('Amplitude');
hold on;
stem(ts,xs);
legend('Original signal', 'Sampled signal', 'Location' , 'BestOutside');

subplot(4,1,2);
plot(ts,xs);
hold on;
stem(ts,qv);
xlabel('Sampled time');
ylabel('Sampled & Quantized data');
legend('Sampled values', 'Quantized values', 'Location' , 'BestOutside');

subplot(4,1,3);
stem(ts,xs);
hold on;
stem(ts,qv);
xlabel('Sampled time');
ylabel('Sampled & Quantized data');
legend('Sampled Signal', 'Quantized Signal', 'Location' , 'BestOutside');

subplot(4,1,4);
stairs(xe,e);
axis([0 1 -0.2 1.2]);
ylabel('Bit value');
xlabel('Bit Index');

%Conclusions
bitrate = fs*n
bit_duration = 1/bitrate
MaxQError = del/2
QNoisePower =(del*del)/12
QNoisePower_dB = 10*log(QNoisePower)/log(10)
SignalPower=Am*Am/2
SignalPower_dB = 10*log(SignalPower)/log(10)
SQNR=10*log(SignalPower/QNoisePower)/log(10)
SQNR_formula=6.02*n+1.761

%Mean Square Error
error = (xs - qv);
errsqr = (xs - qv).^2;
MSE = sum(errsqr)/length(error)