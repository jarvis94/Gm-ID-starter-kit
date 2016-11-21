% Rev. 20141019, Boris Murmann
% The function "lookupVGS" is a companion function to "lookup." It finds
% the transistor VGS for a given inversion level (GM_ID) and given terminal
% voltages. The function interpolates when the requested points lie off the
% simulation grid
%
% There are two basic usage scenarios:
% (1) Lookup VGS with known voltage at the source terminal
% (2) Lookup VGS with unknown source voltage, e.g. when the source of the
% transistor is the tail node of a differential pair
%
% In usage mode (1), the input to the function is GM_ID, L, VDS and VSB.
% At most two of these inputs can be specified as vectors.
% Basic example:
%
% VGS = lookupVGS(data, 'GM_ID', 10, 'VDS', 0.6, 'VSB', 0.1, 'L', 0.1)
%
% When VSB, VDS or L are not specified, their default values are assumed:
%
% VSB = 0;
% L = min(data.L); (minimum length)
% VDS = max(data.VDS)/2; (VDD/2)
%
% In usage mode (2), VDB and VGB must be supplied to the function, for
% example:
%
% VGS = lookupVGS(data, 'GM_ID', 10, 'VDB', 0.6, 'VGB', 1, 'L', 0.1)
%
% The default interpolation method for the final 1-D interpolation
% is "pchip". It can be set to a different method by passing e.g. 'METHOD',
% 'linear' to the function. All other multidimensional interpolation
% operations use 'linear' (fixed), since any other method requires
% continuous derivates; this is rarely satisfiead across all dimensions,
% even with the best device models.
%
% In usage mode (1), one of the parameters passed to the function can be
% a vector (for example, GM_ID or VDS). The remaining parameters passed
% to the function must be scalars. The output is a column vector.
%
% Usage mode (2) supports only scalar parameters as its inputs.
%
function output = lookupVGS(data, varargin)

% default values for parameters
defaultL = min(data.L);
defaultVDS = max(data.VDS)/2;
defaultVDB = NaN;
defaultVGB = NaN;
defaultGM_ID = NaN;
defaultVSB  = 0;
defaultMETHOD  = 'pchip';

% parse arguments
p = inputParser; 
p.addParamValue('L', defaultL);
p.addParamValue('VGB', defaultVGB);
p.addParamValue('GM_ID', defaultGM_ID);
p.addParamValue('VDS', defaultVDS);
p.addParamValue('VDB', defaultVDB);
p.addParamValue('VSB', defaultVSB);
p.addParamValue('METHOD', defaultMETHOD);
p.KeepUnmatched = false;
p.parse(varargin{:});
par = p.Results;

% determine usage mode
if(isnan(par.VGB(1)) && isnan(par.VDB(1)) && ~isnan(par.GM_ID(1)))
    mode = 1;
else if (~isnan(par.VGB(1)) && ~isnan(par.VDB(1)) && ~isnan(par.GM_ID(1)))
    mode = 2;
else
    disp('Invalid syntax or usage mode! Please type "help lookupVGS".')
    output = [];
    return;       
    end
end

if mode == 1
    VGS = data.VGS;
    gm_id = lookup(data, 'GM_ID', 'VGS', data.VGS, 'VDS', par.VDS, 'VSB', par.VSB, 'L', par.L);
    
else % mode == 2
    step   = data.VGS(2)-data.VGS(1);
    VSB    = (min(data.VSB):step:max(data.VSB))';
    VGS    = par.VGB - VSB;
	VDS    = par.VDB - VSB;
	gm_id  = lookup(data, 'GM_ID', 'VGS', VGS, 'VDS', VDS, 'VSB', VSB, 'L', ones(length(VSB),1)*par.L);
    idx    = isfinite(gm_id);
    gm_id  = gm_id(idx);
    VGS    = VGS(idx);
end


if  ~isempty(find(isnan(gm_id), 1))
    disp('*** Interpolation error (NaN) in function lookupVGS.')
    output = [];
    return;       
end

% Permutation needed if L is passed as a vector
if length(par.L) > 1
    gm_id = permute(gm_id, [2, 1]);
end

% This for loop is needed because because interp1 requires a vector as
% its first argument, cannot use a matrix
s = size(gm_id);
output = NaN(length(par.GM_ID), s(2));
for j = 1:s(2)
    output(:,j) = interp1(gm_id(:,j), VGS, par.GM_ID, par.METHOD);
end

% Force column vector if the output is one dimensional
if length(size(output))==2 && min(size(output))==1
    output = output(:);
end

return
