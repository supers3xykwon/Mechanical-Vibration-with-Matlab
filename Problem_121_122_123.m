clc
clear
close all

% Define initial conditions.
x0_1 = [0.2, 0] ;
x0_2 = [-0.2, 0];
x0_3 = [0, 0.2] ;

% time domain.
tspan = [0, 5];

%% Underdamped system
% Solve the EOM
[t1, x1] = ode23(@underdamped, tspan, x0_1);
[t2, x2] = ode23(@underdamped, tspan, x0_2);
[t3, x3] = ode23(@underdamped, tspan, x0_3);

%% Critically damped system
% Solve the EOM
[t4, x4] = ode23(@criticallydamped, tspan, x0_1);
[t5, x5] = ode23(@criticallydamped, tspan, x0_2);
[t6, x6] = ode23(@criticallydamped, tspan, x0_3);

%% Overdamped system
% Solve the EOM
[t7, x7] = ode23(@overdamped, tspan, x0_1);
[t8, x8] = ode23(@overdamped, tspan, x0_2);
[t9, x9] = ode23(@overdamped, tspan, x0_3);

%% Plotting the results
% Plot 
subplot(2,3,1)
hold on
plot(t1, x1(:,1));
plot(t2, x2(:,1));
plot(t3, x3(:,1));
grid on
xlabel('time [s]');
ylabel('displacement [m]');
legend("x_o = 0.2", "x_o = -0.2", "v_o = 0.2")
title('Problem 2.121: Underdamped');
hold off

subplot(2,3,2)
hold on
plot(t4, x4(:,1));
plot(t5, x5(:,1));
plot(t6, x6(:,1));
grid on
xlabel('time [s]');
ylabel('displacement [m]');
legend("x_o = 0.2", "x_o = -0.2", "v_o = 0.2")
title('Problem 2.122: criticallydamped');
hold off

subplot(2,3,3)
hold on
plot(t7, x7(:,1));
plot(t8, x8(:,1));
plot(t9, x9(:,1));
grid on
xlabel('time [s]');
ylabel('displacement [m]');
legend("x_o = 0.2", "x_o = -0.2", "v_o = 0.2")
title('Problem 2.123: overdamped');
hold off

subplot(2,3,4)
hold on
plot(t1, x1(:,1));
plot(t4, x4(:,1));
plot(t7, x7(:,1));
grid on
xlabel('time [s]');
ylabel('displacement [m]');
legend("Underdamped", "criticallydamped", "overdamped")
title('x_o = 0.2');
hold off

subplot(2,3,5)
hold on
plot(t2, x2(:,1));
plot(t5, x5(:,1));
plot(t8, x8(:,1));
grid on
xlabel('time [s]');
ylabel('displacement [m]');
legend("Underdamped", "criticallydamped", "overdamped")
title('x_o = -0.2');
hold off

subplot(2,3,6)
hold on
plot(t3, x3(:,1));
plot(t6, x6(:,1));
plot(t9, x9(:,1));
grid on
xlabel('time [s]');
ylabel('displacement [m]');
legend("Underdamped", "criticallydamped", "overdamped")
title('v_o = 0.2');
hold off