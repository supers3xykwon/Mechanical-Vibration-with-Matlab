clc
clear
close all

% Define initial conditions.
x0_1 = [0.0, 0.0] ;

% time domain.
tspan = [0, 10];

%% system
% Solve the EOM by a Numerical solver
[t1, x1] = ode45(@HFDV, tspan, x0_1);

% Solve the EOM by hand
t_a = t1 ; 
x2 = 0.01098*sin(10*t_a) - 7.1618*10^(-3)*cos(10*t_a) ;
x3 = 0.01311*sin(10*t_a - 0.5779) ;

%% Plot the displacement
figure
plot(t1, x1(:,1));
hold on
plot(t_a, x2) ;
plot(t_a, x3) ;
grid on
xlabel('time [s]');
ylabel('displacement [m]');
legend('Numerical', 'sol1', 'sol2');
title('Problem 3.4: harmonically forced vibration - Resonance System');
hold off

%% Plotting the results in state-space
figure
plot(x1(:,1), x1(:,2));
grid on
xlabel('Displacement [m]');
ylabel('Velocity [m/s]');
title('Problem 3.4: harmonically forced vibration - Resonance System');