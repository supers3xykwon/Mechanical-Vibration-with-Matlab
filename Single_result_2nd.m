clc
clear
close all

% Define initial conditions.
x0_1 = [0.1, 0.5] ;

% time domain.
tspan = [0, 5];

%% system
% Solve the EOM by a Numerical solver
[t1, x1] = ode45(@HFV, tspan, x0_1);


%% Plot the displacement
figure
plot(t1, x1(:,1)+1);
grid on
xlabel('time [s]');
ylabel('displacement [m]');
legend('Numerical2');
title('Problem 3.4: harmonically forced vibration - Resonance System');

%% Plotting the results in state-space
figure
plot(x1(:,1), x1(:,2));
grid on
xlabel('Displacement [m]');
ylabel('Velocity [m/s]');
title('Problem 3.4: harmonically forced vibration - Resonance System');