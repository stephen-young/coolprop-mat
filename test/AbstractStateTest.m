% Script to test the wrapper of the AbstractState dll functions

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
% Note: MATLAB crashes instead of returning an error code in CoolProp v6.4.3
density = state.rhomass();
assert(state.err_code ~= 0)

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

%% accessor methods

state = CoolProp.AbstractState('HEOS', 'water');
state.update(CoolProp.InputPair.PQ_INPUTS, 101325, 0);
assert(state.err_code == 0)

value_exp = state.keyed_output(CoolProp.Parameter.iBvirial);
value_got = state.Bvirial();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'Bvirial accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iCvirial);
value_got = state.Cvirial();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'Cvirial accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iPIP);
value_got = state.PIP();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'PIP accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iP_max);
value_got = state.Pmax();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'Pmax accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iP_min);
value_got = state.Pmin();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'Pmin accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iPrandtl);
value_got = state.Prandtl();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'Prandtl accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iQ);
value_got = state.Q();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'Q accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iT);
value_got = state.T();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'T accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iT_critical);
value_got = state.T_critical();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'T_critical accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iT_reducing);
value_got = state.T_reducing();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'T_reducing accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iT_triple);
value_got = state.T_triple();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'T_triple accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iT_max);
value_got = state.Tmax();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'Tmax accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iT_min);
value_got = state.Tmin();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'Tmin accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iacentric_factor);
value_got = state.acentric_factor();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'acentric_factor accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iZ);
value_got = state.compressibility_factor();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'compressibility_factor accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iconductivity);
value_got = state.conductivity();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'conductivity accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iCp0mass);
value_got = state.cp0mass();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'cp0mass accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iCp0molar);
value_got = state.cp0molar();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'cp0molar accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iCpmass);
value_got = state.cpmass();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'cpmass accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iCpmolar);
value_got = state.cpmolar();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'cpmolar accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iCvmass);
value_got = state.cvmass();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'cvmass accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iCvmolar);
value_got = state.cvmolar();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'cvmolar accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.ifundamental_derivative_of_gas_dynamics);
value_got = state.fundamental_derivative_of_gas_dynamics();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'fundamental_derivative_of_gas_dynamics accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.igas_constant);
value_got = state.gas_constant();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'gas_constant accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iGmass);
value_got = state.gibbsmass();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'gibbsmass accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iGmolar);
value_got = state.gibbsmolar();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'gibbsmolar accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iGmolar_residual);
value_got = state.gibbsmolar_residual();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'gibbsmolar_residual accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iHelmholtzmass);
value_got = state.helmholtzmass();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'helmholtzmass accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iHelmholtzmolar);
value_got = state.helmholtzmolar();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'helmholtzmolar accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iHmass);
value_got = state.hmass();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'hmass accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iHmolar);
value_got = state.hmolar();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'hmolar accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iHmolar_residual);
value_got = state.hmolar_residual();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'hmolar_residual accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iisentropic_expansion_coefficient);
value_got = state.isentropic_expansion_coefficient();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'isentropic_expansion_coefficient accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iisobaric_expansion_coefficient);
value_got = state.isobaric_expansion_coefficient();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'isobaric_expansion_coefficient accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iisothermal_compressibility);
value_got = state.isothermal_compressibility();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'isothermal_compressibility accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.imolar_mass);
value_got = state.molar_mass();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'molar_mass accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iP);
value_got = state.p();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'p accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iP_critical);
value_got = state.p_critical();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'p_critical accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iP_reducing);
value_got = state.p_reducing();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'p_reducing accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iP_triple);
value_got = state.p_triple();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'p_triple accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iPhase);
value_got = state.phase();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'phase accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iDmass);
value_got = state.rhomass();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'rhomass accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.irhomass_critical);
value_got = state.rhomass_critical();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'rhomass_critical accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iDmolar);
value_got = state.rhomolar();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'rhomolar accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.irhomolar_critical);
value_got = state.rhomolar_critical();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'rhomolar_critical accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.irhomolar_reducing);
value_got = state.rhomolar_reducing();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'rhomolar_reducing accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iSmass);
value_got = state.smass();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'smass accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iSmolar);
value_got = state.smolar();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'smolar accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iSmolar_residual);
value_got = state.smolar_residual();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'smolar_residual accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.ispeed_sound);
value_got = state.speed_sound();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'speed_sound accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.isurface_tension);
value_got = state.surface_tension();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'surface_tension accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iUmass);
value_got = state.umass();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'umass accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iUmolar);
value_got = state.umolar();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'umolar accessor did not match keyed output')

value_exp = state.keyed_output(CoolProp.Parameter.iviscosity);
value_got = state.viscosity();
assert(abs(value_exp - value_got) <= max(abs(value_exp), abs(value_got))*1e-6,'viscosity accessor did not match keyed output')

