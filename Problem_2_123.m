clc
clear
close all

% Define initial conditions.
x0_1 = [0.2, 0] ;
x0_2 = [-0.2, 0];
x0_3 = [0, 0.2] ;

% time domain.
tspan = [0, 5];

% Solve the EOM
[t1, x1] = ode23(@overdamped, tspan, x0_1);
[t2, x2] = ode23(@overdamped, tspan, x0_2);
[t3, x3] = ode23(@overdamped, tspan, x0_3);

% Plotting the results
hold on
plot(t1, x1(:,1));
plot(t2, x2(:,1));
plot(t3, x3(:,1));
xlabel('time [s]');
ylabel('displacement [m]');
legend("x_o = 0.2", "x_o = -0.2", "v_o = 0.2")
title('Problem 2.123: overdamped');
