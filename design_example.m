% Basic gm/ID design example
% Boris Murmann
% Stanford University

clear all;
close all;
load 180n.mat;

% Specs
Av0 = 4; RL = 1e3; CL = 50e-15; Rs = 10e3; ITAIL = 600e-6;

% Component calculations
gm = Av0/RL;
gm_id = gm/(ITAIL/2);
wT = lookup(nch, 'GM_CGG', 'GM_ID', gm_id);
cgd_cgg = lookup(nch, 'CGD_CGG', 'GM_ID', gm_id);
cdd_cgg = lookup(nch, 'CDD_CGG', 'GM_ID', gm_id);
cgg = gm/wT;
cgd = cgd_cgg*cgg;
cdd = cdd_cgg*cgg;
cdb = cdd - cgd;
cgs = cgg - cgd;

% Pole calculations
b1 = Rs*(cgs + cgd*(1+Av0))+RL*(CL+cgd);
b2 = Rs*RL*(cgs*CL + cgs*cgd + CL*cgd);
fp1 = 1/2/pi/b1
fp2 = 1/2/pi*b1/b2

% Device sizing
id_w = lookup(nch, 'ID_W', 'GM_ID', gm_id)
w = ITAIL/2 / id_w
