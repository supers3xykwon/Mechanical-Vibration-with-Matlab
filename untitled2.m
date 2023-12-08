clc
clear
close all

M = 50 ; % kg, Mass of a rigid plate
l = 1.20 ; % m, Length of rigid plate
J = M * l^2 /3 ; 
m = 25 ; % kg, Mass of a small fan
k = 40000 ; % N/m
c = 177 ; % N-s/m
w = 750*2*pi/60 ; % rad/s
e = 2.5*10^(-3) ; % m

A = - (c*l^2)/J ;
B = - k*(J+ m*(l*2)/64)/(m*J) ;
C = - (k*c*l^2)/(m*J) ;
D = - (k*l)^2/(64*m*J) ;
E = + (k*e*w^2)/J   ;

Mat = [0 1 0 0 ; 0 0 1 0 ; 0 0 0 1 ; A B C D] ;

