close all;
clear all;

beta = 5;
n = -8:8; %Suitable value of n
J = besselj(n,beta);
disp(sum(J.^2)); %Sum of squares is very close to 1.
