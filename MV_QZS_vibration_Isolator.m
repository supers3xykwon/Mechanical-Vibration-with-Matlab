clc
clear
close all

% Define initial conditions
x0_1 = [0.0, 0.0] ;

% time domain
tspan = [0, 15];

%% system
% Solve the EOM by a Numerical solver 'ode45'
[t1, x1] = ode45(@QZSVIr, tspan, x0_1);
[t2, x2] = ode45(@QZSVItay,  tspan, x0_1);
[t3, x3] = ode45(@QZSVItayhigher,  tspan, x0_1);

%% Plot the displacement
figure
subplot(3,1,1)
plot(t1, x1(:,1));
grid on
xlabel('time [s]');
ylabel('displacement [m]');
title('original');

subplot(3,1,2)
plot(t2, x2(:,1));
grid on
xlabel('time [s]');
ylabel('displacement [m]');
title('2nd-order taylor expansion');

subplot(3,1,3)
plot(t3, x3(:,1));
grid on
xlabel('time [s]');
ylabel('displacement [m]');
title('3nd-order taylor expansion');

%% Plotting the results in state-space
figure
subplot(1,3,1)
plot(x1(:,1), x1(:,2));
grid on
xlabel('Displacement [m]');
ylabel('Velocity [m/s]');
title('original');

subplot(1,3,2)
plot(x2(:,1), x2(:,2));
grid on
xlabel('Displacement [m]');
ylabel('Velocity [m/s]');
title('2nd-order taylor expansion');

subplot(1,3,3)
plot(x3(:,1), x3(:,2));
grid on
xlabel('Displacement [m]');
ylabel('Velocity [m/s]');
title('3nd-order taylor expansion');