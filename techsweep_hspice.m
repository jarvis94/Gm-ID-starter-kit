% Matlab script for technology characterization
% Boris Murmann
% Stanford University
clear all;
close all;

% Path to hspice toolbox (http://www.cppsim.com/download_hspice_tools.html)
addpath('./HspiceToolbox')

% Load configuration
c = techsweep_config_bsim3_180_hspice;

% Simulation loop
for i = 1:length(c.LENGTH)
    str=sprintf('L = %2.2f', c.LENGTH(i));
    disp(str);
    
    for j = 1:length(c.VSB)
        
        % Write simulation parameters
        fid=fopen('techsweep_params.sp', 'w');
        fprintf(fid,'.param length = %d\n', c.LENGTH(i));
        fprintf(fid,'.param sb = %d\n', c.VSB(j));
        fclose(fid);
        
        % Run simulator
        [status,result] = system(c.simcmd);
        if(status)
            disp('Simulation did not run properly. Check techsweep.out.')
            return;
        end    

        %Read and store results
        h = loadsig(c.outfile);
        for k = 1: length(c.outvars)
            nch.(c.outvars{k})(i,:,:,j)  = evalsig(h, c.nvars{k});
            pch.(c.outvars{k})(i,:,:,j)  = evalsig(h, c.pvars{k});
        end
    end
end

% Include sweep info
nch.INFO   = c.modelinfo; 
nch.VGS    = c.VGS';
nch.VDS    = c.VDS';
nch.VSB    = c.VSB';
nch.L      = c.LENGTH';
nch.W      = c.WIDTH;
nch.NFING  = c.NFING;
pch.INFO   = c.modelinfo;
pch.VGS    = c.VGS';
pch.VDS    = c.VDS';
pch.VSB    = c.VSB';
pch.L      = c.LENGTH';
pch.W      = c.WIDTH;
pch.NFING  = c.NFING;

save(c.savefilen, 'nch');
save(c.savefilep, 'pch');
