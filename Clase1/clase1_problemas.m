clear all
close all
clc

%earth kinematics
mu_earth=398600;

%CubeSat kinematics and dynamics
r_earth=6378; %[Km]

N_r_H2N_0=[7000;0;0]; %[Km]
N_dr_H2N_0=[0;7.6408;0]; %[Km/s]

%astrophysics constants
astrophysical_constants=[mu_earth;r_earth];