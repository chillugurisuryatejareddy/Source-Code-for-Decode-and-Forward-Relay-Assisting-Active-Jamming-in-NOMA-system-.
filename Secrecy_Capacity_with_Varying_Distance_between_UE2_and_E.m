clc
clear all 
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cap_s1=[];
cap_s2=[];
% Fading severity is kept 2 for the chosen environment.
m1=2;
m2=2;
m3=2;
m4=2;
m5=2;
m6=2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=3; % Path loss exponent.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Distances of users according to the system model.
d1=0.3;
d2=1.2;
d3=1.3;
d4=1.5;
d5=0.2:0.2:2.0; %varying the distance d5.
d6=2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Channel mean power.
omega1=d1^-n;
omega2=d2^-n;
omega3=d3^-n;
omega4=d4^-n;
omega5=d5.^-n;
omega6=d6^-n;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NO=1; %Noise power.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Threshold levels for UE1, UE2 and eavesdropper.
gammadbCU1=2;
gammadbCU2=2;
gammadbCU3=2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Psdb=20; % Power from S.
P1db=15; % Jamming signal power.
NOL=10^6; %number of iterations.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Power allocation coefficients.
alpha1=0.2;
alpha2=0.8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[OP1_A,OP2_A,OP1E_A,OP2E_A,cap_1_A,cap_2_A,cap_1E_A,cap_2E_A,cap_S1_A,cap_S2_A,gamma1f_A,gamma2f_A]=OP_cap_jd5(m1,omega1,m2,omega2,m3,omega3,m4,omega4,m5,omega5,m6,omega6,NO,gammadbCU1,gammadbCU2,gammadbCU3,Psdb,P1db,NOL,alpha1,alpha2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculating secrecy capacity.
Cap_A=cap_S1_A+cap_S2_A;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



dlmwrite('OP1_A.txt', OP1_A,'delimiter', '\t', 'precision', 6);
dlmwrite('OP2_A.txt', OP2_A,'delimiter', '\t', 'precision', 6);
dlmwrite('OP1E_A.txt', OP1E_A,'delimiter', '\t', 'precision', 6);
dlmwrite('OP2E_A.txt', OP2E_A,'delimiter', '\t', 'precision', 6);
dlmwrite('OP_A.txt', OP_A,'delimiter', '\t', 'precision', 6);
dlmwrite('cap_1_A.txt', cap_1_A,'delimiter', '\t', 'precision', 6);
dlmwrite('cap_2_A.txt', cap_2_A,'delimiter', '\t', 'precision', 6);
dlmwrite('cap_1E_A.txt', cap_1E_A,'delimiter', '\t', 'precision', 6);
dlmwrite('cap_2E_A.txt', cap_2E_A,'delimiter', '\t', 'precision', 6);
dlmwrite('cap_S1_A.txt', cap_S1_A,'delimiter', '\t', 'precision', 6);
dlmwrite('cap_S2_A.txt', cap_S2_A,'delimiter', '\t', 'precision', 6);
dlmwrite('cap_A.txt', Cap_A,'delimiter', '\t', 'precision', 6);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(4),
plot(d5,Cap_A,'-bo')
grid on
xlabel('Normalized Distance between UE_2 and E')
ylabel('Secrecy Capacity (bps/Hz)')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%END%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
