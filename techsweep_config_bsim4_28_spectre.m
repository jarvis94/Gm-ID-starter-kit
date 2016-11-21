% Configuration for techsweep_spectre.m
% Boris Murmann
% Stanford University
function c = techsweep_config_bsim4_28_spectre

% Models and file paths
c.modelfile = '"./models/28nm/toplevel.scs" section=top_tt';
c.modelinfo = '28nm CMOS, BSIM4';
c.corner = 'NOM';
c.temp = 300;
c.modeln = 'nch_lvt_mac';
c.modelp = 'nch_lvt_mac';
c.savefilen = '28nch';
c.savefilep = '28pch';
c.simcmd = 'set path=($path /cad/cadence/IC615.06.15.502.lnx/tools/bin); /cad/cadence/MMSIM7.20.284.lnx86/tools/bin/spectre techsweep.scs >! techsweep.out';
c.outfile = 'techsweep.raw';
c.sweep = 'sweepvds_sweepvgs-sweep';

% Sweep parameters
c.VGS_step = 25e-3;
c.VDS_step = 25e-3;
c.VSB_step = 0.1;
c.VGS_max = 0.9;
c.VDS_max = 0.9;
c.VSB_max = 0.7;
c.VGS = 0:c.VGS_step:c.VGS_max;
c.VDS = 0:c.VDS_step:c.VDS_max;
c.VSB = 0:c.VSB_step:c.VSB_max;
c.LENGTH = [(0.03:0.01:0.06) (0.08:0.02:0.2) (0.25:0.05:1)];
c.WIDTH = 10;
c.NFING = 10;

% Variable mapping
c.outvars =            {'ID','VT','IGD','IGS','GM','GMB','GDS','CGG','CGS','CSG','CGD','CDG','CGB','CDD','CSS'};
c.n{1}= {'mn:ids','A',   [1    0    0     0     0    0     0     0     0     0     0     0     0     0     0  ]};
c.n{2}= {'mn:vth','V',   [0    1    0     0     0    0     0     0     0     0     0     0     0     0     0  ]};
c.n{3}= {'mn:igd','A',   [0    0    1     0     0    0     0     0     0     0     0     0     0     0     0  ]};
c.n{4}= {'mn:igs','A',   [0    0    0     1     0    0     0     0     0     0     0     0     0     0     0  ]};
c.n{5}= {'mn:gm','S',    [0    0    0     0     1    0     0     0     0     0     0     0     0     0     0  ]};
c.n{6}= {'mn:gmbs','S',  [0    0    0     0     0    1     0     0     0     0     0     0     0     0     0  ]};
c.n{7}= {'mn:gds','S',   [0    0    0     0     0    0     1     0     0     0     0     0     0     0     0  ]};
c.n{8}= {'mn:cgg','F',   [0    0    0     0     0    0     0     1     0     0     0     0     0     0     0  ]};
c.n{9}= {'mn:cgs','F',   [0    0    0     0     0    0     0     0    -1     0     0     0     0     0     0  ]};
c.n{10}={'mn:cgd','F',   [0    0    0     0     0    0     0     0     0     0    -1     0     0     0     0  ]};
c.n{11}={'mn:cgb','F',   [0    0    0     0     0    0     0     0     0     0     0     0    -1     0     0  ]};
c.n{12}={'mn:cdd','F',   [0    0    0     0     0    0     0     0     0     0     0     0     0     1     0  ]};
c.n{13}={'mn:cdg','F',   [0    0    0     0     0    0     0     0     0     0     0    -1     0     0     0  ]};
c.n{14}={'mn:css','F',   [0    0    0     0     0    0     0     0     0     0     0     0     0     0     1  ]};
c.n{15}={'mn:csg','F',   [0    0    0     0     0    0     0     0     0    -1     0     0     0     0     0  ]};
c.n{16}={'mn:cjd','F',   [0    0    0     0     0    0     0     0     0     0     0     0     0     1     0  ]};
c.n{17}={'mn:cjs','F',   [0    0    0     0     0    0     0     0     0     0     0     0     0     0     1  ]};
%
%                      {'ID','VT','IGD','IGS','GM','GMB','GDS','CGG','CGS','CSG','CGD','CDG','CGB','CDD','CSS'};
c.p{1}= {'mp:ids','A',   [-1   0    0     0     0    0     0     0     0     0     0     0     0     0     0  ]};
c.p{2}= {'mp:vth','V',   [0    1    0     0     0    0     0     0     0     0     0     0     0     0     0  ]};
c.p{3}= {'mp:igd','A',   [0    0   -1     0     0    0     0     0     0     0     0     0     0     0     0  ]};
c.p{4}= {'mp:igs','A',   [0    0    0    -1     0    0     0     0     0     0     0     0     0     0     0  ]};
c.p{5}= {'mp:gm','S',    [0    0    0     0     1    0     0     0     0     0     0     0     0     0     0  ]};
c.p{6}= {'mp:gmbs','S',  [0    0    0     0     0    1     0     0     0     0     0     0     0     0     0  ]};
c.p{7}= {'mp:gds','S',   [0    0    0     0     0    0     1     0     0     0     0     0     0     0     0  ]};
c.p{8}= {'mp:cgg','F',   [0    0    0     0     0    0     0     1     0     0     0     0     0     0     0  ]};
c.p{9}= {'mp:cgs','F',   [0    0    0     0     0    0     0     0    -1     0     0     0     0     0     0  ]};
c.p{10}={'mp:cgd','F',   [0    0    0     0     0    0     0     0     0     0    -1     0     0     0     0  ]};
c.p{11}={'mp:cgb','F',   [0    0    0     0     0    0     0     0     0     0     0     0    -1     0     0  ]};
c.p{12}={'mp:cdd','F',   [0    0    0     0     0    0     0     0     0     0     0     0     0     1     0  ]};
c.p{13}={'mp:cdg','F',   [0    0    0     0     0    0     0     0     0     0     0    -1     0     0     0  ]};
c.p{14}={'mp:css','F',   [0    0    0     0     0    0     0     0     0     0     0     0     0     0     1  ]};
c.p{15}={'mp:csg','F',   [0    0    0     0     0    0     0     0     0    -1     0     0     0     0     0  ]};
c.p{16}={'mp:cjd','F',   [0    0    0     0     0    0     0     0     0     0     0     0     0     1     0  ]};
c.p{17}={'mp:cjs','F',   [0    0    0     0     0    0     0     0     0     0     0     0     0     0     1  ]};

% Simulation netlist
netlist = sprintf([...
'//techsweep.scs \n'...
'include  %s\n'...
'include "techsweep_params.scs" \n'...
'save mn \n'...
'save mp \n'...
'parameters gs=0 ds=0 \n'...
'vdsn     (vdn 0)         vsource dc=ds  \n'...
'vgsn     (vgn 0)         vsource dc=gs  \n'...
'vbsn     (vbn 0)         vsource dc=-sb \n'...
'vdsp     (vdp 0)         vsource dc=-ds \n'...
'vgsp     (vgp 0)         vsource dc=-gs \n'...
'vbsp     (vbp 0)         vsource dc=sb  \n'...
'\n'...
'mn (vdn vgn 0 vbn) nch_lvt_mac l=length*1e-6 w=10e-6 multi=1 nf=10 _ccoflag=1\n'...
'mp (vdp vgp 0 vbp) pch_lvt_mac l=length*1e-6 w=10e-6 multi=1 nf=10 _ccoflag=1\n'...
'\n'...
'options1 options gmin=1e-13 reltol=1e-4 vabstol=1e-6 iabstol=1e-10 temp=%d tnom=27 rawfmt=psfbin rawfile="./techsweep.raw" \n'...
'sweepvds sweep param=ds start=0 stop=%d step=%d { \n'...
'sweepvgs dc param=gs start=0 stop=%d step=%d \n'...
'}\n'...
], c.modelfile, ...
c.temp-273, ...
c.VGS_max, c.VGS_step, ...
c.VDS_max, c.VDS_step);

% Write netlist
fid = fopen('techsweep.scs', 'w');
fprintf(fid, netlist);
fclose(fid);

return



