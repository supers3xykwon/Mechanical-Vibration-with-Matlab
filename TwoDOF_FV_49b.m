function dxdt = TwoDOF_FV_49b(t, x) % 2-Dof Free vibration = TwoDOF_FV
    % Define the masses, damping coefficients, and spring coefficients
    m = 17 ;
    k = 100 ;

    Fo = 100 ;
    w = 1 ;

    % Define Equation of Motion ; Mx'' + Cx' + Kx = 0
    dxdt = zeros(6,1); % intializing vector for which save EOM.
    dxdt(1) = -(7/25)*(m/k)*x(3) - (3/25)*(m/k)*x(6) ; % x1 = x, dx1/dt = dx/dt = x2, dx2/dt = d^2x/dt^2 = x''
    dxdt(2) = x(2);
    dxdt(3) = x(3);
    dxdt(4) = -(3/50)*(m/k)*x(3) - (12/50)*(m/k)*x(6) + 0.5*(Fo/k)*sin(w*t) ;
    dxdt(5) = x(5) ;
    dxdt(6) = x(6) ;
end
