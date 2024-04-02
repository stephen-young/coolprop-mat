% CoolPropParameterTest tests index values of properties in LowLevelCoolProp

import CoolProp.*
alias = CoolProp.ALIAS;
path_to_lib = fullfile(getenv('APPDATA'), 'CoolProp', 'CoolProp.dll');
path_to_header = fullfile(getenv('APPDATA'), 'CoolProp', 'CoolPropLib.h');
if ~libisloaded(alias)
    loadlibrary(path_to_lib, path_to_header, 'alias', alias);
end

iT = calllib(alias,'get_param_index', 'T'); % Temperature in K
iP = calllib(alias,'get_param_index', 'P'); % Pressure in Pa
iDmolar = calllib(alias,'get_param_index', 'Dmolar'); % Molar density in mol/m^3
iHmolar = calllib(alias,'get_param_index', 'Hmolar'); % Molar specific enthalpy in J/mol
iSmolar = calllib(alias,'get_param_index', 'Smolar'); % Molar specific entropy in J/mol/K
iUmolar = calllib(alias,'get_param_index', 'Umolar'); % Molar specific internal energy in J/mol
iGmolar = calllib(alias,'get_param_index', 'Gmolar'); % Molar specific Gibbs energy in J/mol
iHelmholtzmolar = calllib(alias,'get_param_index', 'Helmholtzmolar'); % Molar specific Helmholtz energy in J/mol
iDmass = calllib(alias,'get_param_index', 'Dmass'); % Mass density in kg/m^3
iHmass = calllib(alias,'get_param_index', 'Hmass'); % Mass specific enthalpy in J/kg
iSmass = calllib(alias,'get_param_index', 'Smass'); % Mass specific entropy in J/kg/K
iUmass = calllib(alias,'get_param_index', 'Umass'); % Mass specific internal energy in J/kg
iGmass = calllib(alias,'get_param_index', 'Gmass'); % Mass specific Gibbs energy in J/kg
iHelmholtzmass = calllib(alias,'get_param_index', 'Helmholtzmass'); % Mass specific Helmholtz energy in J/kg
iQ = calllib(alias,'get_param_index', 'Q'); % Molar vapor quality in mol/mol
iDelta = calllib(alias,'get_param_index', 'Delta'); % Reduced density (rho/rhoc) in -
iTau = calllib(alias,'get_param_index', 'Tau'); % Reciprocal reduced temperature (Tc/T) in -

% Output only
iCpmolar = calllib(alias,'get_param_index', 'Cpmolar'); % Molar specific constant pressure specific heat in J/mol/K
iCpmass = calllib(alias,'get_param_index', 'Cpmass'); % Mass specific constant pressure specific heat in J/kg/K
iCvmolar = calllib(alias,'get_param_index', 'Cvmolar'); % Molar specific constant volume specific heat in J/mol/K
iCvmass = calllib(alias,'get_param_index', 'Cvmass'); % Mass specific constant volume specific heat in J/kg/K
iCp0molar = calllib(alias,'get_param_index', 'Cp0molar'); % Ideal gas molar specific constant pressure specific heat in J/mol/K
iCp0mass = calllib(alias,'get_param_index', 'Cp0mass'); % Ideal gas mass specific constant pressure specific heat in J/kg/K
iHmolar_residual = calllib(alias,'get_param_index', 'Hmolar_residual'); % Residual molar enthalpy in J/mol/K
iSmolar_residual = calllib(alias,'get_param_index', 'Smolar_residual'); % Residual molar entropy (sr/R = s(T,rho) - s^0(T,rho)) in J/mol/K
iGmolar_residual = calllib(alias,'get_param_index', 'Gmolar_residual'); % Residual molar Gibbs energy in J/mol/K
iGWP20 = calllib(alias,'get_param_index', 'GWP20'); % 20-year global warming potential in -
iGWP100 = calllib(alias,'get_param_index', 'GWP100'); % 100-year global warming potential in -
iGWP500 = calllib(alias,'get_param_index', 'GWP500'); % 500-year global warming potential in -
iFH = calllib(alias,'get_param_index', 'FH'); % Flammability hazard in -
iHH = calllib(alias,'get_param_index', 'HH'); % Health hazard in -
iPH = calllib(alias,'get_param_index', 'PH'); % Physical hazard in -
iODP = calllib(alias,'get_param_index', 'ODP'); % Ozone depletion potential in -
iBvirial = calllib(alias,'get_param_index', 'Bvirial'); % Second virial coefficient in -
iCvirial = calllib(alias,'get_param_index', 'Cvirial'); % Third virial coefficient in -
idBvirial_dT = calllib(alias,'get_param_index', 'dBvirial_dT'); % Derivative of second virial coefficient with respect to T in -
idCvirial_dT = calllib(alias,'get_param_index', 'dCvirial_dT'); % Derivative of third virial coefficient with respect to T in -
igas_constant = calllib(alias,'get_param_index', 'gas_constant'); % Molar gas constant in J/mol/K
imolar_mass = calllib(alias,'get_param_index', 'molar_mass'); % Molar mass in kg/mol
iacentric_factor = calllib(alias,'get_param_index', 'acentric'); % Acentric factor in -
idipole_moment = calllib(alias,'get_param_index', 'dipole_moment'); % Dipole moment in C-m
irhomass_reducing = calllib(alias,'get_param_index', 'rhomass_reducing'); % Mass density at reducing point in kg/m^3
irhomolar_reducing = calllib(alias,'get_param_index', 'rhomolar_reducing'); % Molar density at reducing point in mol/m^3
irhomolar_critical = calllib(alias,'get_param_index', 'rhomolar_critical'); % Molar density at critical point in mol/m^3
irhomass_critical = calllib(alias,'get_param_index', 'rhomass_critical'); % Mass density at critical point in kg/m^3
iT_reducing = calllib(alias,'get_param_index', 'T_reducing'); % Temperature at the reducing point in K
iT_critical = calllib(alias,'get_param_index', 'T_critical'); % Temperature at the critical point in K
iT_triple = calllib(alias,'get_param_index', 'T_triple'); % Temperature at the triple point in K
iT_max = calllib(alias,'get_param_index', 'T_max'); % Maximum temperature limit in K
iT_min = calllib(alias,'get_param_index', 'T_min'); % Minimum temperature limit in K
iP_min = calllib(alias,'get_param_index', 'P_min'); % Minimum pressure limit in Pa
iP_max = calllib(alias,'get_param_index', 'P_max'); % Maximum pressure limit in Pa
iP_critical = calllib(alias,'get_param_index', 'p_critical'); % Pressure at the critical point in Pa
iP_reducing = calllib(alias,'get_param_index', 'p_reducing'); % Pressure at the reducing point in Pa
iP_triple = calllib(alias,'get_param_index', 'p_triple'); % Pressure at the triple point (pure only) in Pa
ifraction_min = calllib(alias,'get_param_index', 'fraction_min'); % Fraction (mole, mass, volume) minimum value for incompressible solutions in -
ifraction_max = calllib(alias,'get_param_index', 'fraction_max'); % Fraction (mole, mass, volume) maximum value for incompressible solutions in -
iT_freeze = calllib(alias,'get_param_index', 'T_freeze'); % Freezing temperature for incompressible solutions in K
ispeed_sound = calllib(alias,'get_param_index', 'speed_of_sound'); % Speed of sound in m/s
iviscosity = calllib(alias,'get_param_index', 'viscosity'); % Viscosity in Pa-s
iconductivity = calllib(alias,'get_param_index', 'conductivity'); % Thermal conductivity in W/m/K
isurface_tension = calllib(alias,'get_param_index', 'surface_tension'); % Surface tension in N/m
iPrandtl = calllib(alias,'get_param_index', 'Prandtl'); % Prandtl number in -
iisothermal_compressibility = calllib(alias,'get_param_index', 'isothermal_compressibility'); % Isothermal compressibility in 1/Pa
iisobaric_expansion_coefficient = calllib(alias,'get_param_index', 'isobaric_expansion_coefficient'); % Isobaric expansion coefficient in 1/K
iisentropic_expansion_coefficient = calllib(alias,'get_param_index', 'isentropic_expansion_coefficient'); % Isentropic expansion coefficient in -
iZ = calllib(alias,'get_param_index', 'Z'); % Compressibility factor in -
ifundamental_derivative_of_gas_dynamics = calllib(alias,'get_param_index', 'fundamental_derivative_of_gas_dynamics'); % Fundamental derivative of gas dynamics in -
iPIP = calllib(alias,'get_param_index', 'PIP'); % Phase identification parameter in -
ialphar = calllib(alias,'get_param_index', 'alphar'); % Residual Helmholtz energy in -
idalphar_dtau_constdelta = calllib(alias,'get_param_index', 'dalphar_dtau_constdelta'); % Derivative of residual Helmholtz energy with tau in -
idalphar_ddelta_consttau = calllib(alias,'get_param_index', 'dalphar_ddelta_consttau'); % Derivative of residual Helmholtz energy with delta in -
ialpha0 = calllib(alias,'get_param_index', 'alpha0'); % Ideal Helmholtz energy in -
idalpha0_dtau_constdelta = calllib(alias,'get_param_index', 'dalpha0_dtau_constdelta'); % Derivative of ideal Helmholtz energy with tau in -
idalpha0_ddelta_consttau = calllib(alias,'get_param_index', 'dalpha0_ddelta_consttau'); % Derivative of ideal Helmholtz energy with delta in -
id2alpha0_ddelta2_consttau = calllib(alias,'get_param_index', 'd2alpha0_ddelta2_consttau'); % Second derivative of ideal Helmholtz energy with delta in -
id3alpha0_ddelta3_consttau = calllib(alias,'get_param_index', 'd3alpha0_ddelta3_consttau'); % Third derivative of ideal Helmholtz energy with delta in -
iPhase = calllib(alias,'get_param_index', 'Phase'); % Phase index as a float in -

%% iT
assert(Parameter.iT == iT);
%% iP
assert(Parameter.iP == iP);
%% iDmolar
assert(Parameter.iDmolar == iDmolar);
%% iHmolar
assert(Parameter.iHmolar == iHmolar);
%% iSmolar
assert(Parameter.iSmolar == iSmolar);
%% iUmolar
assert(Parameter.iUmolar == iUmolar);
%% iGmolar
assert(Parameter.iGmolar == iGmolar);
%% iHelmholtzmolar
assert(Parameter.iHelmholtzmolar == iHelmholtzmolar);
%% iDmass
assert(Parameter.iDmass == iDmass);
%% iHmass
assert(Parameter.iHmass == iHmass);
%% iSmass
assert(Parameter.iSmass == iSmass);
%% iUmass
assert(Parameter.iUmass == iUmass);
%% iGmass
assert(Parameter.iGmass == iGmass);
%% iHelmholtzmass
assert(Parameter.iHelmholtzmass == iHelmholtzmass);
%% iQ
assert(Parameter.iQ == iQ);
%% iDelta
assert(Parameter.iDelta == iDelta);
%% iTau
assert(Parameter.iTau == iTau);

%% iCpmolar
assert(Parameter.iCpmolar == iCpmolar);
%% iCpmass
assert(Parameter.iCpmass == iCpmass);
%% iCvmolar
assert(Parameter.iCvmolar == iCvmolar);
%% iCvmass
assert(Parameter.iCvmass == iCvmass);
%% iCp0molar
assert(Parameter.iCp0molar == iCp0molar);
%% iCp0mass
assert(Parameter.iCp0mass == iCp0mass);
%% iHmolar_residual
assert(Parameter.iHmolar_residual == iHmolar_residual);
%% iSmolar_residual
assert(Parameter.iSmolar_residual == iSmolar_residual);
%% iGmolar_residual
assert(Parameter.iGmolar_residual == iGmolar_residual);
%% iGWP20
assert(Parameter.iGWP20 == iGWP20);
%% iGWP100
assert(Parameter.iGWP100 == iGWP100);
%% iGWP500
assert(Parameter.iGWP500 == iGWP500);
%% iFH
assert(Parameter.iFH == iFH);
%% iHH
assert(Parameter.iHH == iHH);
%% iPH
assert(Parameter.iPH == iPH);
%% iODP
assert(Parameter.iODP == iODP);
%% iBvirial
assert(Parameter.iBvirial == iBvirial);
%% iCvirial
assert(Parameter.iCvirial == iCvirial);
%% idBvirial_dT
assert(Parameter.idBvirial_dT == idBvirial_dT);
%% idCvirial_dT
assert(Parameter.idCvirial_dT == idCvirial_dT);
%% igas_constant
assert(Parameter.igas_constant == igas_constant);
%% imolar_mass
assert(Parameter.imolar_mass == imolar_mass);
%% iacentric_factor
assert(Parameter.iacentric_factor == iacentric_factor);
%% idipole_moment
assert(Parameter.idipole_moment == idipole_moment);
%% irhomass_reducing
assert(Parameter.irhomass_reducing == irhomass_reducing);
%% irhomolar_reducing
assert(Parameter.irhomolar_reducing == irhomolar_reducing);
%% irhomolar_critical
assert(Parameter.irhomolar_critical == irhomolar_critical);
%% irhomass_critical
assert(Parameter.irhomass_critical == irhomass_critical);
%% iT_reducing
assert(Parameter.iT_reducing == iT_reducing);
%% iT_critical
assert(Parameter.iT_critical == iT_critical);
%% iT_triple
assert(Parameter.iT_triple == iT_triple);
%% iT_max
assert(Parameter.iT_max == iT_max);
%% iT_min
assert(Parameter.iT_min == iT_min);
%% iP_min
assert(Parameter.iP_min == iP_min);
%% iP_max
assert(Parameter.iP_max == iP_max);
%% iP_critical
assert(Parameter.iP_critical == iP_critical);
%% iP_reducing
assert(Parameter.iP_reducing == iP_reducing);
%% iP_triple
assert(Parameter.iP_triple == iP_triple);
%% ifraction_min
assert(Parameter.ifraction_min == ifraction_min);
%% ifraction_max
assert(Parameter.ifraction_max == ifraction_max);
%% iT_freeze
assert(Parameter.iT_freeze == iT_freeze);
%% ispeed_sound
assert(Parameter.ispeed_sound == ispeed_sound);
%% iviscosity
assert(Parameter.iviscosity == iviscosity);
%% iconductivity
assert(Parameter.iconductivity == iconductivity);
%% isurface_tension
assert(Parameter.isurface_tension == isurface_tension);
%% iPrandtl
assert(Parameter.iPrandtl == iPrandtl);
%% iisothermal_compressibility
assert(Parameter.iisothermal_compressibility == iisothermal_compressibility);
%% iisobaric_expansion_coefficient
assert(Parameter.iisobaric_expansion_coefficient == iisobaric_expansion_coefficient);
%% iisentropic_expansion_coefficient
assert(Parameter.iisentropic_expansion_coefficient == iisentropic_expansion_coefficient);
%% iZ
assert(Parameter.iZ == iZ);
%% ifundamental_derivative_of_gas_dynamics
assert(Parameter.ifundamental_derivative_of_gas_dynamics == ifundamental_derivative_of_gas_dynamics);
%% iPIP
assert(Parameter.iPIP == iPIP);
%% ialphar
assert(Parameter.ialphar == ialphar);
%% idalphar_dtau_constdelta
assert(Parameter.idalphar_dtau_constdelta == idalphar_dtau_constdelta);
%% idalphar_ddelta_consttau
assert(Parameter.idalphar_ddelta_consttau == idalphar_ddelta_consttau);
%% ialpha0
assert(Parameter.ialpha0 == ialpha0);
%% idalpha0_dtau_constdelta
assert(Parameter.idalphar_dtau_constdelta == idalphar_dtau_constdelta);
%% idalpha0_ddelta_consttau
assert(Parameter.idalpha0_ddelta_consttau   == idalpha0_ddelta_consttau);
%% id2alpha0_ddelta2_consttau
assert(Parameter.id2alpha0_ddelta2_consttau == id2alpha0_ddelta2_consttau);
%% id3alpha0_ddelta3_consttau
assert(Parameter.id3alpha0_ddelta3_consttau == id3alpha0_ddelta3_consttau);
%% iPhase
assert(Parameter.iPhase == iPhase);

