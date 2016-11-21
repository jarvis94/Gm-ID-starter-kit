% Basic usage examples for function "lookup"
% Boris Murmann
% Stanford University
% Rev. 20141220
clear all;
close all;

% Load data table
load 180nch.mat;

% Plot drain characteristics vor different VGS at minimum L (default)
vgs = 0:0.1:max(nch.VGS);
id = lookup(nch, 'ID', 'VGS', vgs, 'VDS', nch.VDS);
figure(1)
plot(nch.VDS, id')
xlabel('V_D_S [V]')
ylabel('I_D [A]')

% Plot fT against gm_ID for different L
gm_id = 5:0.1:20;
wt = lookup(nch, 'GM_CGG', 'GM_ID', gm_id, 'L', nch.L');
figure(2)
semilogy(gm_id, wt/2/pi)
xlabel('g_m/I_D [S/A]')
ylabel('f_T [Hz]')

% Plot ID/W against gm_ID for different L
% Note that VDS is not specified here; it then defaults to max(nch.VDS)/2
id_w = lookup(nch, 'ID_W', 'GM_ID', gm_id, 'L', nch.L');
figure(3)
semilogy(gm_id, id_w)
xlabel('g_m/I_D [S/A]')
ylabel('I_D/W [A/m]')

% Plot gm/gds against gm_id at two different L and default VDS
lmin = min(nch.L);
gm_gds = lookup(nch, 'GM_GDS', 'GM_ID', gm_id, 'L', [lmin 2*lmin]);
figure(4)
plot(gm_id, gm_gds)
xlabel('g_m/I_D [S/A]')
ylabel('g_m/g_d_s')

% Given gm_ID, VDS, VSB and L, find VGS
vgs1 = lookupVGS(nch, 'GM_ID', [10 12], 'VDS', 0.6, 'VSB', 0.3, 'L', 0.2)

% Given gm_ID and everything else at default, find VGS
vgs2 = lookupVGS(nch, 'GM_ID', 10)

