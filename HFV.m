function dxdt = HFV(t, x) % harmonically forced vibration = HFV
    
    % Define the two parameter damping ratio, and natural frequency
    m = 1 ; % kg
    k = 36 ; % N/m
    F = 3.6 ; % N
    w = 6 ; % rad/s

    % Define Equation of Motion
    dxdt = zeros(2,1); % intializing vector for which save EOM.
    dxdt(1) = x(2); % x1 = x, dx1/dt = dx/dt = x2
    dxdt(2) = -k/m * x(1) + F/m*sin(w*t); 

end
