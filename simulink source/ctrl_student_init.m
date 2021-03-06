close all
clear all
clc




%%
syms u v r X Y N

%% MATRICES

m    = 14.79;   I_z  =  1.7600;   x_g = 0.0375;       % x_g  =  0.0460; % Table B.1


%% Added mass
X_ud  =     -2.0;											% Table B.1
					Y_vd =     -10.0;	N_vd =    -0.0;		% Table B.1
					Y_rd =      -0.0;	N_rd =    -1.0;		% Table B.1

%% Total mass matrix
m_11 = m-X_ud;
m_22 = m-Y_vd;
m_23 = m*x_g-Y_rd;
m_32 = m*x_g-N_vd;
m_33 = I_z-N_rd;

M    = [m_11 0    0
        0    m_22 m_23
        0    m_32 m_33];
	
%% Damping coefficients
% Comments at the end of the lines indicate the old values used.
X_u		= -0.6555;		X_v		= 0;
X_uu 	= 0.3545;		X_vv	= -2.443;
X_uuu 	= -3.787;		X_vvv	= 0;

						Y_v		= -1.33; 			Y_r		= -7.250; % Y_r
						Y_vv	= -2.776;			Y_rr	= -3.450; % Y_rr
						Y_vvv	= -64.91;			Y_rrr	= 0;
						
						Y_rv	= -0.805;			Y_vr	= -0.845; % Y_rv, Y_vr

						N_v		= 0;				N_r		= -1.900; % N_r
						N_vv	= -0.2088;			N_rr	= -0.750; % N_rr
						N_vvv	= 0;				N_rrr	= 0;
						
						N_rv	= 0.130;			N_vr	= 0.080; % N_rv, N_vr

%% Correolis matrix
c_13 = -(m-Y_vd)*v-(m*x_g-Y_rd)*r;
c_23 = (m-X_ud)*u;
C    = [0     0     c_13
        0     0     c_23
        -c_13 -c_23 0   ];

%% Assembly of the damping matrix
d_11 = -X_u - X_uu*u - X_uuu*u^2;
d_22 = -Y_v - Y_vv*v - Y_vvv*v^2 - Y_rv*abs(r);
d_33 = -N_r - N_rr*abs(r) - N_rrr*r^2 - N_vr*abs(v); % using abs(r)

d_12 = -X_v - X_vv*v - X_vvv*v^2;
d_23 = -Y_r - Y_rr*abs(r) - Y_rrr*r^2 - Y_vr*abs(v);
d_32 = -N_v - N_vv*v - N_vvv*v^2 - N_rv*abs(r);

D    = [d_11 d_12 0
        0    d_22 d_23
        0    d_32 d_33];
    
matlabFunction(D,'file','ctrl_student_observer_D.m','vars',[u v r]);
matlabFunction(C,'file','ctrl_student_observer_C.m','vars',[u v r]);

%%

w_d_x = 1;
w_d_y = 1;
w_d_psi = 1;

zeta_x = 1;
zeta_y = 1;
zeta_psi = 1; 
%w_d = ;
%zeta = eye(3);

L = diag([1 1 1]);

v_max = [0.3 0.1 1];

K_p_x = 10;
K_p_y = 10;
K_p_psi = 5;

K_i_x = 0;
K_i_y = 0;
K_i_psi = 0.1;

K_d_x = 5;
K_d_y = 5;
K_d_psi = 2;

x_0 = 1;
y_0 = 3;
psi_0 = 1;

x_ref = 4;
y_ref = 3;
psi_ref = pi;
K_2 = diag([2 2 2]);

K_3 = diag([2 2 2]);

K_4 = diag([2 2 2]);

time = 100;
h = 0.01;
%sim('CSE1_DP.slx')
%plot_script
