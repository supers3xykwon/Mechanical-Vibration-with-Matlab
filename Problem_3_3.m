clc
clear
close all

% Define initial conditions.
x0_1 = [0.1, 0] ;
x0_2 = [0, 10];
x0_3 = [0.1, 10] ;

% time domain.
tspan = [0, 2];

%% Underdamped system
% Solve the EOM
[t1, x1] = ode45(@HFV, tspan, x0_1);
[t2, x2] = ode45(@HFV, tspan, x0_2);
[t3, x3] = ode45(@HFV, tspan, x0_3);

%% Plotting the results
% Plot 
figure
hold on
plot(t1, x1(:,1));
plot(t2, x2(:,1));
plot(t3, x3(:,1));
grid on
xlabel('time [s]');
ylabel('displacement [m]');
legend("(a) x_0 = 0.1", "(b) v_0 = 10", "(c) x_0 = 0.1, v_0 = 10")
title('Problem 3.4: harmonically forced vibration - Resonance System');
hold off

%% Plotting the results in state-space
figure
hold on
plot(10.*x1(:,1), x1(:,2));
plot(10.*x2(:,1), x2(:,2));
plot(10.*x3(:,1), x3(:,2));
grid on
xlabel('Displacement*10 [m]');
ylabel('Velocity [m/s]');
legend("(a) x_0 = 0.1", "(b) v_0 = 10", "(c) x_0 = 0.1, v_0 = 10")
title('Problem 3.4: harmonically forced vibration - Resonance System');
axis equal
hold off