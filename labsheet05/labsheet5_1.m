close all;
clear all;

syms fm;
syms n;
syms t;
fs = 1000;
Ts = 1/fs;

eq1 = 2*pi*fm*n*Ts == n*pi*0.25;
eq2 = 2*pi*fm*n*Ts == n*(pi*0.25 + 2*pi);
eq3 = 2*pi*fm*n*Ts == n*(pi*0.25 + 6*pi);

solve(eq1,fm)
solve(eq2,fm)
solve(eq3,fm)