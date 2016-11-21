% Configuration for techsweep_spectre.m
% Boris Murmann
% Stanford University
function c = techsweep_config_psp_65_spectre

% Models and file paths
c.modelfile = './models/include_nominalstrip.scs';
c.modelinfo = '65nm CMOS, PSP';
c.corner = 'NOM';
c.temp = 300;
c.modeln = 'nsvtlprf';
c.modelp = 'psvtlprf';
c.savefilen = '65nch';
c.savefilep = '65pch';
c.simcmd = 'set path=($path /cad/cadence/IC615.06.15.502.lnx/tools/bin); /cad/cadence/MMSIM7.20.284.lnx86/tools/bin/spectre techsweep.scs >! techsweep.out';
c.outfile = 'techsweep.raw';
c.sweep = 'sweepvds_sweepvgs-sweep';

% Sweep parameters
c.VGS_step = 25e-3;
c.VDS_step = 25e-3;
c.VSB_step = 0.1;
c.VGS_max = 1.2;
c.VDS_max = 1.2;
c.VSB_max = 0.8;
c.VGS = 0:c.VGS_step:c.VGS_max;
c.VDS = 0:c.VDS_step:c.VDS_max;
c.VSB = 0:c.VSB_step:c.VSB_max;
c.LENGTH = [(0.06:0.01:0.2) (0.25:0.05:1)];
c.WIDTH = 10;
c.NFING = 5;

% Variable mapping
c.outvars =                  {'ID','VT','IGD','IGS','GM','GMB','GDS','CGG','CGS','CSG','CGD','CDG','CGB','CDD','CSS'};
c.n{1}= {'mn.m1.m1:ids','A',   [1    0    0     0     0    0     0     0     0     0     0     0     0     0     0  ]};
c.n{2}= {'mn.m1.m1:vth','V',   [0    1    0     0     0    0     0     0     0     0     0     0     0     0     0  ]};
c.n{3}= {'mn.m1.m1:igd','A',   [0    0    1     0     0    0     0     0     0     0     0     0     0     0     0  ]};
c.n{4}= {'mn.m1.m1:igs','A',   [0    0    0     1     0    0     0     0     0     0     0     0     0     0     0  ]};
c.n{5}= {'mn.m1.m1:gm','Ohm',  [0    0    0     0     1    0     0     0     0     0     0     0     0     0     0  ]};
c.n{6}= {'mn.m1.m1:gmb','Ohm', [0    0    0     0     0    1     0     0     0     0     0     0     0     0     0  ]};
c.n{7}= {'mn.m1.m1:gds','Ohm', [0    0    0     0     0    0     1     0     0     0     0     0     0     0     0  ]};
c.n{8}= {'mn.m1.m1:cgg','F',   [0    0    0     0     0    0     0     1     0     0     0     0     0     0     0  ]};
c.n{9}= {'mn.m1.m1:cgs','F',   [0    0    0     0     0    0     0     0     1     0     0     0     0     0     0  ]};
c.n{10}={'mn.m1.m1:cgd','F',   [0    0    0     0     0    0     0     0     0     0     1     0     0     0     0  ]};
c.n{11}={'mn.m1.m1:cgb','F',   [0    0    0     0     0    0     0     0     0     0     0     0     1     0     0  ]};
c.n{12}={'mn.m1.m1:cdd','F',   [0    0    0     0     0    0     0     0     0     0     0     0     0     1     0  ]};
c.n{13}={'mn.m1.m1:cdg','F',   [0    0    0     0     0    0     0     0     0     0     0     1     0     0     0  ]};
c.n{14}={'mn.m1.m1:css','F',   [0    0    0     0     0    0     0     0     0     0     0     0     0     0     1  ]};
c.n{15}={'mn.m1.m1:csg','F',   [0    0    0     0     0    0     0     0     0     1     0     0     0     0     0  ]};
c.n{16}={'mn.m1.m1:cgsol','F', [0    0    0     0     0    0     0     1     1     1     0     0     0     0     1  ]};
c.n{17}={'mn.m1.m1:cgdol','F', [0    0    0     0     0    0     0     1     0     0     1     1     0     1     0  ]};
c.n{18}={'mn.m1.m1:cgbol','F', [0    0    0     0     0    0     0     1     0     0     0     0     1     0     0  ]};
c.n{19}={'mn.d1.d1:cj','F',    [0    0    0     0     0    0     0     0     0     0     0     0     0     1     0  ]};
c.n{20}={'mn.d2.d1:cj','F',    [0    0    0     0     0    0     0     0     0     0     0     0     0     0     1  ]};

%                            {'ID','VT','IGD','IGS','GM','GMB','GDS','CGG','CGS','CSG','CGD','CDG','CGB','CDD','CSS'};
c.p{1}= {'mp.m1.m1:ids','A',   [1    0    0     0     0    0     0     0     0     0     0     0     0     0     0  ]};
c.p{2}= {'mp.m1.m1:vth','V',   [0    1    0     0     0    0     0     0     0     0     0     0     0     0     0  ]};
c.p{3}= {'mp.m1.m1:igd','A',   [0    0    1     0     0    0     0     0     0     0     0     0     0     0     0  ]};
c.p{4}= {'mp.m1.m1:igs','A',   [0    0    0     1     0    0     0     0     0     0     0     0     0     0     0  ]};
c.p{5}= {'mp.m1.m1:gm','Ohm',  [0    0    0     0     1    0     0     0     0     0     0     0     0     0     0  ]};
c.p{6}= {'mp.m1.m1:gmb','Ohm', [0    0    0     0     0    1     0     0     0     0     0     0     0     0     0  ]};
c.p{7}= {'mp.m1.m1:gds','Ohm', [0    0    0     0     0    0     1     0     0     0     0     0     0     0     0  ]};
c.p{8}= {'mp.m1.m1:cgg','F',   [0    0    0     0     0    0     0     1     0     0     0     0     0     0     0  ]};
c.p{9}= {'mp.m1.m1:cgs','F',   [0    0    0     0     0    0     0     0     1     0     0     0     0     0     0  ]};
c.p{10}={'mp.m1.m1:cgd','F',   [0    0    0     0     0    0     0     0     0     0     1     0     0     0     0  ]};
c.p{11}={'mp.m1.m1:cgb','F',   [0    0    0     0     0    0     0     0     0     0     0     0     1     0     0  ]};
c.p{12}={'mp.m1.m1:cdd','F',   [0    0    0     0     0    0     0     0     0     0     0     0     0     1     0  ]};
c.p{13}={'mp.m1.m1:cdg','F',   [0    0    0     0     0    0     0     0     0     0     0     1     0     0     0  ]};
c.p{14}={'mp.m1.m1:css','F',   [0    0    0     0     0    0     0     0     0     0     0     0     0     0     1  ]};
c.p{15}={'mp.m1.m1:csg','F',   [0    0    0     0     0    0     0     0     0     1     0     0     0     0     0  ]};
c.p{16}={'mp.m1.m1:cgsol','F', [0    0    0     0     0    0     0     1     1     1     0     0     0     0     1  ]};
c.p{17}={'mp.m1.m1:cgdol','F', [0    0    0     0     0    0     0     1     0     0     1     1     0     1     0  ]};
c.p{18}={'mp.m1.m1:cgbol','F', [0    0    0     0     0    0     0     1     0     0     0     0     1     0     0  ]};
c.p{19}={'mp.d1.d1:cj','F',    [0    0    0     0     0    0     0     0     0     0     0     0     0     1     0  ]};
c.p{20}={'mp.d2.d1:cj','F',    [0    0    0     0     0    0     0     0     0     0     0     0     0     0     1  ]};

% Simulation netlist
netlist = sprintf([...
'//techsweep.scs \n'...
'include "%s" \n'...
'include "techsweep_params.scs" \n'...
'save mn.m1.m1 \n'...
'save mn.d1.d1 \n'...
'save mn.d2.d1 \n'...
'save mp.m1.m1 \n'...
'save mp.d1.d1 \n'...
'save mp.d2.d1 \n'...
'parameters gs=0 ds=0 \n'...
'vdsn     (vdn 0)         vsource dc=ds  \n'...
'vgsn     (vgn 0)         vsource dc=gs  \n'...
'vbsn     (vbn 0)         vsource dc=-sb \n'...
'vdsp     (vdp 0)         vsource dc=-ds \n'...
'vgsp     (vgp 0)         vsource dc=-gs \n'...
'vbsp     (vbp 0)         vsource dc=sb  \n'...
'mn       (vdn vgn 0 vbn) %s  l=length w=%d nfing=%d \n'...
'mp       (vdp vgp 0 vbp) %s  l=length w=%d nfing=%d \n'...
'\n'...
'options1 options gmin=1e-13 reltol=1e-4 vabstol=1e-6 iabstol=1e-10 temp=%d tnom=27 rawfmt=psfbin rawfile="./techsweep.raw" \n'...
'sweepvds sweep param=ds start=0 stop=%d step=%d { \n'...
'sweepvgs dc param=gs start=0 stop=%d step=%d \n'...
'}\n'...
], c.modelfile, ...
c.modeln, c.WIDTH, c.NFING, ...
c.modelp, c.WIDTH, c.NFING, ...
c.temp-273, ...
c.VGS_max, c.VGS_step, ...
c.VDS_max, c.VDS_step);

% Write netlist
fid = fopen('techsweep.scs', 'w');
fprintf(fid, netlist);
fclose(fid);

return



