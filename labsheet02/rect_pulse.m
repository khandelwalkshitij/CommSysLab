function val = rect_pulse(t)
val = heaviside(t+1)-heaviside(t);
end