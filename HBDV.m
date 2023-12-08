function dxdt = HBDV(t, x) % harmonically base excitation damped vibration = HBDV
    
    % Define the two parameter damping ratio, and natural frequency
    m = 2000 ; % kg
    k = 12.337 * 10^6 ; % N/m
    c = 15707.96 ; % N-s/m
    y = 0.2 ; % m
    w = 157.08 ; % rad/s

    % middle parameter
    T = c*w ;

    Y = y * sqrt( k^2 + T^2 ) ; % m
    a = atan(- T / k ); % rad

    % Define Equation of Motion
    dxdt = zeros(2,1); % intializing vector for which save EOM.
    dxdt(1) = x(2); % x1 = x, dx1/dt = dx/dt = x2
    dxdt(2) = -c/m * x(2) -k/m * x(1) + Y/m *sin(w*t - a); 

end