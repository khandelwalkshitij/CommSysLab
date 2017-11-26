close all;
clear all;

z = 0:0.01:25;
J0 = besselj(0,z);
J1 = besselj(1,z);
J2 = besselj(2,z);
J3 = besselj(3,z);
J4 = besselj(4,z);

figure;
plot(z,J0,'red');
hold on;
plot(z,J1,'green');
hold on;
plot(z,J2,'--');
hold on;
plot(z,J3,'-.');
hold on;
plot(z,J4,'blue');
xlabel('z');
ylabel('J(nu,z)');
title('Bessel functions of the first kind');
legend('J0','J1','J2','J3','J4');
grid on;

%For determining zero crossings
for(i=0:0.001:25)
    if(besselj(0,i)<0.0001 && besselj(0,i)>-0.0001)
        disp(i);
    end
end

%Testing a better way in Bessel's Function of second kind
%Instead of making five definitions
Y = zeros(5,25*100+1);
for i = 0:4
    Y(i+1,:) = bessely(i,z);
end

figure;
plot(z,Y)
axis([0 25 -2 1]);
grid on
legend('K0','K1','K2','K3','K4')
title('Bessel Functions of the Second Kind');
xlabel('z');
ylabel('K(z)');

for(i=0:0.001:25)
    if(bessely(0,i)<0.0001&&bessely(0,i)>-0.0001)
        disp(i);
    end
end