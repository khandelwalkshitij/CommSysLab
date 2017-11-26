close all;
clear all;

%QAM

logsnr = 0:0.01:0.8;
snr = 10.^logsnr;
%4~QAM
M = 4;
b = 3/(M-1);
%Formula based calculations
sepsc = 2*(1-1/(sqrt(M)))*qfunc(sqrt(b*snr));
sep1 = 1 - (1 - sepsc).^2;

%By Monte Carlo simulation
sep2 = zeros(1,81); %81 is the size of the logsnr array, initializing sep2

%Getting the value of M symbols
cnt = 1; %For alpha which is going to be a vector of four symbols
for l = 1:sqrt(M)
        for k = 1:sqrt(M)
            %Generating X-coordinate
            al = 2*k - 1 - sqrt(M);
            %Generating Y-coordinate
            aq = 2*l - 1 - sqrt(M);
            %Generating symbols
            alpha(cnt) = sqrt(1.5/(M-1))*(al + 1i*aq);
            cnt = cnt + 1;
        end
end

for val = 1:81
    ebnorm = snr(val);
    error = 0; %initialize error count
    
    %Monte Carlo
    for iterations = 1:100000
       
            %Generating a random value for m for each iteration that will be any one of the symbols
            alpha_iter = alpha(randi(4,1,1));
            n0 = (randn + randn*1i)/sqrt(2);
            y = sqrt(ebnorm)*alpha_iter + n0;
            if ((abs(y - alpha(1)) < abs(y -alpha_iter))||(abs(y - alpha(2)) < abs(y -alpha_iter))||(abs(y - alpha(3)) < abs(y -alpha_iter))||(abs(y - alpha(4)) < abs(y -alpha_iter)))
                error = error+1; %increment error for each iteration of monte carlo simulation
            end
    end
    sep2(val) = error/100000;
end
%Plotting
semilogy(10*logsnr,sep1);
hold on;
semilogy(10*logsnr,sep2);
legend('analytical','MC simulation');
xlabel('SNR in dB');
ylabel('SEP');

%SEP = 0.04548 for N0B = 33dbm and Ps = 9dB