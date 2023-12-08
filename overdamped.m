function dxdt = overdamped(t, x)
    
    % Define the two parameter damping ratio, and natural frequency
    zeta = 2.0; % damping ratio
    w = 10;     % natural frequency

    % Define Equation of Motion
    dxdt = zeros(2,1); % intializing vector for which save EOM.
    dxdt(1) = x(2); % x1 = x, dx1/dt = dx/dt = x2
    dxdt(2) = -2*w*zeta* x(2) - w^2*x(1); 
end
