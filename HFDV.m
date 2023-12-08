function dxdt = HFDV(t, x) % harmonically forced damped vibration = HFDV
    
    % Define the two parameter damping ratio, and natural frequency
    m = 1.45833 ; % kg
    k = 625 ; % N/m
    c = 31.25 ;
    F = 7.5 ; % N
    w = 10 ; % rad/s

    % Define Equation of Motion
    dxdt = zeros(2,1); % intializing vector for which save EOM.
    dxdt(1) = x(2); % x1 = x, dx1/dt = dx/dt = x2
    dxdt(2) = -c/m * x(2) -k/m * x(1) + F/m *sin(w*t); 

end
