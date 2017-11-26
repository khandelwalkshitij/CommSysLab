close all;
clear all;

syms t;
f = 1/t;
w = 2*pi*f;
fc = 1000;
wc = 2*pi*fc;
k = 13;
a = 19;
func1 = exp(-j*wc*t);
four1 = simplify(fourier(func1))
func2 = heaviside(t);
four2 = simplify(fourier(func2))
func3 = sin(2*pi*fc*t);
four3 = simplify(fourier(func3))
func4 = k*exp(-a*t)*func2;
four4 = simplify(fourier(func4))
func5 = sin(pi*t)/(pi*t);
four5 = simplify(fourier(func5))
