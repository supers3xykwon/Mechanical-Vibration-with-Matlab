function dxdt = TwoDOF_FV_31(t, x) % 2-Dof Free vibration = TwoDOF_FV
    % Define the masses, damping coefficients, and spring coefficients
    m1 = 1 ;
    m2 = 2 ;

    k = 10 ;

    l = 1 ;
    d = 0.5 ;
    
    J1 = m1*l^2 ;
    J2 = m2*l^2 ;

    g = 9.81 ;

    % Define Equation of Motion ; Mx'' + Cx' + Kx = 0
    dxdt = zeros(4,1); % intializing vector for which save EOM.
    dxdt(1) =   x(2) ; % x1 = x, dx1/dt = dx/dt = x2, dx2/dt = d^2x/dt^2 = x''
    dxdt(2) = - k*d^2/J1 * x(1) + k*d^2 * x(3) - m1*g*l*x(1) ;
    dxdt(3) =   x(4) ;
    dxdt(4) =   k*d^2/J2 * x(1) - k*d^3 * x(3) - m2*g*l*x(3) ;
end
