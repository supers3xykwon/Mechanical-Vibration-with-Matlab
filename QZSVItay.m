function dxdt = QZSVItay(t, x) % Quasi-Zero Stiffness Vibration Isolator with taylor expansion = QZSVItay
    
    % Define the two parameter damping ratio, and natural frequency
    zeta = 0.1 ;
    wv = 10 ; % omega_v
    wk = 20 ; % omega_k
    w = 30  ; % omega
    l = 0.5 ; % compressed lenght of spring h
    L = 1.0   ; % original lenght
    a = 10 ; % a == F/m

    % Define Equation of Motion
    dxdt = zeros(2,1); % intializing vector for which save EOM.
    wn = sqrt(wv^2 + 2*wk^2*(1-(2*l*L)/(x(1)^2 + 2^l^2))) ; 
    dxdt(1) = x(2); % x1 = x, dx1/dt = dx/dt = x2
    dxdt(2) = a*cos(w*t) - 2*zeta*wn*x(2) - wn^2*x(1) ; 

end
