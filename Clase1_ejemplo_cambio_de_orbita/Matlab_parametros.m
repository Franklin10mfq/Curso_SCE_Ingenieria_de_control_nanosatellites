clear all
close all
clc

%earth kinematics
mu_earth=398600;

%CubeSat kinematics and dynamics
angles_313_spacecraft=[0;30;0]*pi/180; %3-1-3, Omega, i, theta
r_earth=6378;

apogee_0=400+r_earth;
perigee_0=401+r_earth;

N_r_H2N_0=Euler3132C(angles_313_spacecraft)'*[perigee_0;0;0];

e_0=(apogee_0-perigee_0)/(apogee_0+perigee_0);
a_0=2*(apogee_0*perigee_0)/(apogee_0+perigee_0);
b_0=a_0*(1-e_0^2)^0.5;

h=sqrt(perigee_0*mu_earth*(1+e_0));

vel_0_launch=h/perigee_0;
N_dr_H2N_0=Euler3132C(angles_313_spacecraft)'*[0;vel_0_launch;0];

%astrophysics constants
astrophysical_constants=[mu_earth;r_earth;a_0;b_0;apogee_0;perigee_0];

%mission
state=0;
t_prev=0;

ra=a_0;
rb=20000;
rc=10000;
epsilon_dr=0.0001;

vap1=sqrt(mu_earth/a_0);
h2=sqrt(2*mu_earth)*sqrt(ra*rb/(ra+rb));
vap2=h2/ra;
vbp2=h2/rb;
h3=sqrt(2*mu_earth)*sqrt(rc*rb/(rb+rc));
vbp3=h3/rb;
vcp3=h3/rc;
vcp4=sqrt(mu_earth/rc);
dVA=vap2-vap1;
dVB=vbp3-vbp2;
dVC=vcp4-vcp3;

maneuvers=[dVA;dVB;dVC];