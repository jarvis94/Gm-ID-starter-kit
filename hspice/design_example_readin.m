clear all;
close all;
addpath('.\HSpiceToolbox');

h = loadsig('design_example.ac0');
lssig(h)

f = evalsig(h,'HERTZ');
vod = evalsig(h,'vod');
magdb = 20*log10(abs(vod));
f3dB = interp1(magdb, f, magdb(1)-3, 'spline')
s = sprintf('f_3_d_B = %3.2d', f3dB);

figure(1);
semilogx(f, magdb, 'linewidth', 2);
title(s)
xlabel('Frequency [Hz]');
ylabel('Magnitude [dB]');
axis([1e6 1e11 -80 20]);
grid;
