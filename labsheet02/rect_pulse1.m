function x1 = rect_pulse1(t)
x1 = rect_pulse(t+0.5).*heaviside(-t);
end