function dxdt = TwoDOF_FV(t, x) % 2-Dof Free vibration = TwoDOF_FV
    % Define the masses, damping coefficients, and spring coefficients
    m1 = 1 ;
    m2 = 2 ;

    c1 = 0.1 ;
    c2 = 0.2 ;
    c3 = 0.3 ;

    k1 = 1 ;
    k2 = 2 ;
    k3 = 3 ;

    f1 = 10 ;
    f2 = 30 ;

    w1 = 1 ;
    w2 = sqrt(3) ;

    % Define the coefficient matrices
    %{
    M = [m1 0 ; 0 m2] ;
    C = [c1 + c2 -c2 ; -c2 c2 + c3] ;
    K = [k1+k2 -k2 ; -k2 k2+k3] ; 
    %}
    
    % Define Equation of Motion ; Mx'' + Cx' + Kx = 0
    dxdt = zeros(4,1); % intializing vector for which save EOM.
    dxdt(1) = x(2) ; % x1 = x, dx1/dt = dx/dt = x2, dx2/dt = d^2x/dt^2 = x''
    dxdt(2) = -(k1+k2)/m1 * x(1) -(c1+c2)/m1 *x(2) + k2/m1 * x(3) + c2/m1 * x(4) + f1 * sin(w1 * t)/m1;
    dxdt(3) = x(4) ;
    dxdt(4) =  k2/m2 * x(1) + c2/m2 * x(2) -(k2+k3)/m2 * x(3) -(c2+c3)/m2 * x(4) + f2 * sin(w2 * t)/m2;

end
