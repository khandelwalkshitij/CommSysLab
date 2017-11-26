function x2 = rect_pulse2(t)
x2 = rect_pulse(t+0.4).*heaviside(-t);
end