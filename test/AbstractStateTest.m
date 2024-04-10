% Script to test the wrapper of the AbstractState dll functions

% TODO test specify phase
% TODO test accessor methods

if ~libisloaded(CoolProp.CoolProp.ALIAS)
    CoolProp.CoolProp.load();
end

%% Construction HEOS backend

state = CoolProp.AbstractState('HEOS', 'water');

assert(state.err_code == 0)

%% Construction INCOMP backend

state = CoolProp.AbstractState('INCOMP', 'MNA');

assert(state.err_code == 0)

%% Construction REFPROP backend

if ispc
    [status, ~] = system('where REFPRP64.dll');
else
    [status, ~] = system('which REFPRP64.dll');
end

assert(status == 0, 'REFPROP was not found on your system. Test aborted.')

state = CoolProp.AbstractState('REFPROP', 'water');

assert(state.err_code == 0)

%% Construction fluid mixture

state = CoolProp.AbstractState('HEOS', 'nitrogen&oxygen');
assert(state.err_code == 0)

%% Updating fluid state

state = CoolProp.AbstractState('HEOS', 'water');
state.update(CoolProp.InputPair.PQ_INPUTS, 101325, 0);
assert(state.err_code == 0)

%Check for error when using undefined input pair index
state.update(500, 101325, 0);
assert(state.err_code ~= 0)

%% Setting fractions

state = CoolProp.AbstractState('HEOS', 'nitrogen&oxygen');

% Attempt setting state before fractions are set (expect error)
state.update(CoolProp.InputPair.PT_INPUTS, 101325, 298.15);
assert(state.err_code ~= 0)

% Attempt property retireval before fractions are set (expect error)
% MATLAB is crashing instead of returning an error code
% density = state.rhomass();
% assert(state.err_code ~= 0)

% Set fractions (expect success)
state.set_fractions([0.79, 0.21]);
assert(state.err_code == 0)

% Attempt setting fluid state after fractions are set (expect success)
state.update(CoolProp.InputPair.PT_INPUTS, 101325, 298.15);
assert(state.err_code == 0)

% Attempt property retrieval after fractions and state are set (expect value)
rho_exp = 1.179584873626977;
rho_got = state.rhomass();
assert(state.err_code == 0)
assert(abs(rho_exp - rho_got) < 1e-6)

%% Setting INCOMP fractions

state = CoolProp.AbstractState('INCOMP', 'MNA');

% Attempt setting state before fractions are set (expect success)
% MNA will assume a mass fraction of 0 without it set
state.update(CoolProp.InputPair.PT_INPUTS, 101325, 298.15);
assert(state.err_code == 0)

% Set fractions (expect success)
state.set_fractions(0.1);
assert(state.err_code == 0)

% Attempt setting fluid state after fractions are set (expect success)
state.update(CoolProp.InputPair.PT_INPUTS, 101325, 298.15);
assert(state.err_code == 0)

% Attempt property retrieval after fractions and state are set (expect value)
rho_exp = 1068.7089719015844;
rho_got = state.rhomass();
assert(state.err_code == 0)
assert(abs(rho_exp - rho_got) < 1e-6)

%% specifying phase
% Examples taken from http://coolprop.org/coolprop/HighLevelAPI.html#imposing-the-phase-optional

state = CoolProp.AbstractState('HEOS', 'water');
state.specify_phase(CoolProp.Phase.iphase_liquid);
assert(state.err_code == 0)
state.update(CoolProp.InputPair.PT_INPUTS, 5e6, 461.1);

rho_exp = 881.000853334732;
rho_got = state.rhomass();
assert(abs(rho_exp - rho_got) < 1e-6)

state.specify_phase(CoolProp.Phase.iphase_gas);
assert(state.err_code == 0)
state.update(CoolProp.InputPair.PT_INPUTS, 5e6, 597.9);

rho_exp = 20.508496070580005;
rho_got = state.rhomass();
assert(abs(rho_exp - rho_got) < 1e-6)

%% keyed output

state = CoolProp.AbstractState('HEOS', 'water');
state.update(CoolProp.InputPair.PQ_INPUTS, 101325, 0);
assert(state.err_code == 0)

temp_exp = 373.124295847701;
temp_got = state.keyed_output(CoolProp.Parameter.iT);
assert(state.err_code == 0)
assert(abs(temp_exp - temp_got) < 1e-6)

%% temperature accessor method

state = CoolProp.AbstractState('HEOS', 'water');
state.update(CoolProp.InputPair.PQ_INPUTS, 101325, 0);
assert(state.err_code == 0)

temp_exp = 373.124295847701;
temp_got = state.T();
assert(state.err_code == 0)
assert(abs(temp_exp - temp_got) < 1e-6)

