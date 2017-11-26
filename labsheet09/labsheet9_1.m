close all;
clear all;

%BPSK

logsnr = 0:0.001:0.8;
snr = 10.^logsnr;
%By Criag's formula
sep1 = qfunc(sqrt(2*snr));
%By Monte Carlo Simulation
sep2 = zeros(1,801); %801 is the size of the logsnr array, initializing sep2
for i = 1:801
    ebnorm = snr(i);
    error = 0; %initialize error count
    alpha = 1; %initialize alpha
    for iterations = 1:100000
        m = floor(2*rand);
        alpha = exp(-1i*2*pi*m/2);
        n0 = (randn + randn*1i)/sqrt(2);
        y = sqrt(ebnorm)*alpha + n0;
        if (m==0 && real(y)<0) || (m==1 && real(y)>0) %check if error by ML Detection
            error = error+1; %increment error for each iteration of monte carlo simulation
        end
    end
    sep2(i) = error/100000;
end
%Plotting
semilogy(10*logsnr,sep1);
hold on;
semilogy(10*logsnr,sep2);
legend('analytical','MC simulation');
xlabel('SNR in dB');
ylabel('SEP');

%SEP = 0.002388 for N0B = -27dbm and Ps = 9dB