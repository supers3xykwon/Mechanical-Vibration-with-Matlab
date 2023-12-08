function dxdt = TwoDOF_FV_49a(t, x) % 2-Dof Free vibration = TwoDOF_FV
    % Define the masses, damping coefficients, and spring coefficients
    m = 10 ;
    k = 100 ;
    l = 1.0 ;
    
    J = 1/12 * m * l^2 ;

    Fo = 100 ;
    w = 100 ;

    % Define Equation of Motion ; Mx'' + Cx' + Kx = 0
    dxdt = zeros(4,1); % intializing vector for which save EOM.
    dxdt(1) = x(2) ; % x1 = x, dx1/dt = dx/dt = x2, dx2/dt = d^2x/dt^2 = x''
    dxdt(2) = -3*k/m * x(1) + 1/6 * k * l * x(3) + Fo/m * sin(w*t) ;
    dxdt(3) = x(4) ;
    dxdt(4) = - k*l/(6*J) * x(1) - (17/36) * k* l^2 /J * x(3) + (1/3)*Fo*l*sin(w*t) ;
end
