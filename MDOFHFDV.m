function dxdt = MDOFHFDV(t, x) % Multi degree of freedom harmonically forced damped vibration = HFDV
    
    % Define the two parameter damping ratio, and natural frequency
    M = 50 ; % kg, Mass of a rigid plate
    l = 1.20 ; % m, Length of rigid plate
    J = M * l^2 /3 ; 
    m = 25 ; % kg, Mass of a small fan
    k = 40000 ; % N/m
    c = 177 ; % N-s/m
    w = 750*2*pi/60 ; % rad/s
    e = 2.5*10^(-3) ; % m

    % Define Equation of Motion
    dxdt = zeros(4,1); % intializing vector for which save EOM.
    dxdt(1) = x(2) ; % x1 = x, dx1/dt = dx/dt = x2
    dxdt(2) = x(3) ;
    dxdt(3) = x(4) ;
    dxdt(4) = - (c*l^2)/J * x(4) - k*(J+ m*(l*2)/64)/(m*J) * x(3) - (k*c*l^2)/(m*J) * x(2) - (k*l)^2/(64*m*J) * x(1) + (k*e*w^2)/J *sin(w*t); 

end
