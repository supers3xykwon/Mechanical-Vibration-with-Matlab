clc
clear
close all

% Define initial conditions.
x0a = [0.0, 0.0, 0.0, 0.0] ;
x0b = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0] ;
% time domain.
tspan = linspace(0, 1, 500);

%% system
% Solve the EOM by a Numerical solver
[t1, x1] = ode45(@TwoDOF_FV_49a, tspan, x0a);
[t2, x2] = ode45(@TwoDOF_FV_49b, tspan, x0b);

%% Plot the displacement
figure
plot(t1, x1(:,1));
hold on
plot(t1, x1(:,3));

plot(t2, x2(:,1));
plot(t2, x2(:,4));
grid on
xlabel('time [s]');
ylabel('displacement [m]');
legend('(a) x_1', '(a) x_2', '(b) x_1', '(b) x_2');
hold off

%% Plotting the results in state-space
figure
plot(x1(:,1), x1(:,2));
hold on
plot(x1(:,3), x1(:,4));
grid on
xlabel('Displacement [m]');
ylabel('Velocity [m/s]');
legend('x1', 'x2');
title('Problem 3.4: harmonically forced vibration - Resonance System');
hold off
