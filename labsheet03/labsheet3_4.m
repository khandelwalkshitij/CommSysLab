close all;
clear all;

%generation
u = 0:0.05:1;
Pc_norm = (0.5)./(0.5+(u.^2)/4);
Pts_norm = ((u.^2)/4)./(0.5+(u.^2)/4);

%plotting
subplot(2,1,1);
plot(u,Pc_norm);
xlabel('modulation index');
ylabel('normalized carrier power');

subplot(2,1,2);
plot(u,Pts_norm);
xlabel('modulation index');
ylabel('normalized total SB power');