% Matlab script for technology characterization
% Display utility to see parameters raw and converted
% Boris Murmann, Stanford University
clear all; close all;

% Load configuration
c = techsweep_config_bsim4_28_spectre;

% Write simulation parameters
fid=fopen('techsweep_params.scs', 'w');
fprintf(fid,'parameters length = %d\n', c.LENGTH(1));
fprintf(fid,'parameters sb = %d\n', c.VSB(1));
fclose(fid);

% Run simulator
system(c.simcmd);
[status,result] = system(c.simcmd);
if(status)
    disp('Simulation did not run properly. Check techsweep.out.')
    return;
end    

cds_srr(c.outfile, c.sweep)

idx1 = round(length(c.VGS)/2);
idx2 = round(length(c.VDS)/2);
s = sprintf('VGS = %d, VDS = %d', c.VGS(idx1), c.VDS(idx2));
disp(s)

% Initialize
for m = 1:length(c.outvars)
    nch.(c.outvars{m}) = 0;
    pch.(c.outvars{m}) = 0;
end

% Read and display raw parameters and created output
for k = 1:length(c.n)
    params_n = c.n{k};
    struct_n = cds_srr(c.outfile, c.sweep, params_n{1});
    values_n = struct_n.(params_n{2});
    s = sprintf('%s = %d', params_n{1}, values_n(idx1, idx2));
    disp(s);
    for m = 1:length(c.outvars)
       nch.(c.outvars{m}) = nch.(c.outvars{m}) + values_n(idx1, idx2)*params_n{3}(m);
    end
end
disp(nch);

for k = 1:length(c.p)
    params_p = c.p{k};
    struct_p = cds_srr(c.outfile, c.sweep, params_p{1});
    values_p = struct_p.(params_p{2});
    s = sprintf('%s = %d', params_p{1}, values_p(idx1, idx2));
    disp(s);
    for m = 1:length(c.outvars)
       pch.(c.outvars{m}) = pch.(c.outvars{m}) + values_p(idx1, idx2)*params_p{3}(m);
    end
end
disp(pch);



