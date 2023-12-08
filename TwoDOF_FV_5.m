function dxdt = TwoDOF_FV_5(t, x) % 2-Dof Free vibration = TwoDOF_FV
    % Define the masses, damping coefficients, and spring coefficients
    m1 = 20 ;
    m2 = 2*m1 ;

    k1 = 1000 ;
    k2 = 2*k1 ;
    
    % Define Equation of Motion ; Mx'' + Cx' + Kx = 0
    dxdt = zeros(4,1); % intializing vector for which save EOM.
    dxdt(1) = x(2) ; % x1 = x, dx1/dt = dx/dt = x2, dx2/dt = d^2x/dt^2 = x''
    dxdt(2) = -(k1+k2)/m1 * x(1) + k2/m1 * x(3) ;
    dxdt(3) = x(4) ;
    dxdt(4) =  k2/m2 * x(1) -k2/m2 * x(3) ;
end
