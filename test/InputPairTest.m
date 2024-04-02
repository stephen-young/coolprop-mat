% CoolPropInputPairTest Test script to check that the values of the input pair
% indicies in the LowLevelCoolProp class match the CoolProp dll

import CoolProp.*

alias = CoolProp.ALIAS;
path_to_lib = fullfile(getenv('APPDATA'), 'CoolProp', 'CoolProp.dll');
path_to_header = fullfile(getenv('APPDATA'), 'CoolProp', 'CoolPropLib.h');

if ~libisloaded(alias)
    loadlibrary(path_to_lib, path_to_header, 'alias', alias);
end

% Retrieve input pair indicies from dll
QT_INPUTS = calllib(alias,'get_input_pair_index', 'QT_INPUTS');
PQ_INPUTS = calllib(alias,'get_input_pair_index', 'PQ_INPUTS');
QSmolar_INPUTS = calllib(alias,'get_input_pair_index', 'QSmolar_INPUTS');
QSmass_INPUTS = calllib(alias,'get_input_pair_index', 'QSmass_INPUTS');
HmolarQ_INPUTS = calllib(alias,'get_input_pair_index', 'HmolarQ_INPUTS');
HmassQ_INPUTS = calllib(alias,'get_input_pair_index', 'HmassQ_INPUTS');
DmolarQ_INPUTS = calllib(alias,'get_input_pair_index', 'DmolarQ_INPUTS');
DmassQ_INPUTS = calllib(alias,'get_input_pair_index', 'DmassQ_INPUTS');
PT_INPUTS = calllib(alias,'get_input_pair_index', 'PT_INPUTS');
DmassT_INPUTS = calllib(alias,'get_input_pair_index', 'DmassT_INPUTS');
DmolarT_INPUTS = calllib(alias,'get_input_pair_index', 'DmolarT_INPUTS');
HmolarT_INPUTS = calllib(alias,'get_input_pair_index', 'HmolarT_INPUTS');
HmassT_INPUTS = calllib(alias,'get_input_pair_index', 'HmassT_INPUTS');
SmolarT_INPUTS = calllib(alias,'get_input_pair_index', 'SmolarT_INPUTS');
SmassT_INPUTS = calllib(alias,'get_input_pair_index', 'SmassT_INPUTS');
TUmolar_INPUTS = calllib(alias,'get_input_pair_index', 'TUmolar_INPUTS');
TUmass_INPUTS = calllib(alias,'get_input_pair_index', 'TUmass_INPUTS');
DmassP_INPUTS = calllib(alias,'get_input_pair_index', 'DmassP_INPUTS');
DmolarP_INPUTS = calllib(alias,'get_input_pair_index', 'DmolarP_INPUTS');
HmassP_INPUTS = calllib(alias,'get_input_pair_index', 'HmassP_INPUTS');
HmolarP_INPUTS = calllib(alias,'get_input_pair_index', 'HmolarP_INPUTS');
PSmass_INPUTS = calllib(alias,'get_input_pair_index', 'PSmass_INPUTS');
PSmolar_INPUTS = calllib(alias,'get_input_pair_index', 'PSmolar_INPUTS');
PUmass_INPUTS = calllib(alias,'get_input_pair_index', 'PUmass_INPUTS');
PUmolar_INPUTS = calllib(alias,'get_input_pair_index', 'PUmolar_INPUTS');
HmassSmass_INPUTS = calllib(alias,'get_input_pair_index', 'HmassSmass_INPUTS');
HmolarSmolar_INPUTS = calllib(alias,'get_input_pair_index', 'HmolarSmolar_INPUTS');
SmassUmass_INPUTS = calllib(alias,'get_input_pair_index', 'SmassUmass_INPUTS');
SmolarUmolar_INPUTS = calllib(alias,'get_input_pair_index', 'SmolarUmolar_INPUTS');
DmassHmass_INPUTS = calllib(alias,'get_input_pair_index', 'DmassHmass_INPUTS');
DmolarHmolar_INPUTS = calllib(alias,'get_input_pair_index', 'DmolarHmolar_INPUTS');
DmassSmass_INPUTS = calllib(alias,'get_input_pair_index', 'DmassSmass_INPUTS');
DmolarSmolar_INPUTS = calllib(alias,'get_input_pair_index', 'DmolarSmolar_INPUTS');
DmassUmass_INPUTS = calllib(alias,'get_input_pair_index', 'DmassUmass_INPUTS');
DmolarUmolar_INPUTS = calllib(alias,'get_input_pair_index', 'DmolarUmolar_INPUTS');


%% QT_INPUTS << Molar quality, Temperature in K
assert(InputPair.QT_INPUTS == QT_INPUTS);

%% PQ_INPUTS << Pressure in Pa, Molar quality
assert(InputPair.PQ_INPUTS == PQ_INPUTS);

%% QSmolar_INPUTS << Molar quality, Entropy in J/mol/K
assert(InputPair.QSmolar_INPUTS == QSmolar_INPUTS);

%% QSmass_INPUTS << Molar quality, Entropy in J/kg/K
assert(InputPair.QSmass_INPUTS == QSmass_INPUTS);

%% HmolarQ_INPUTS << Enthalpy in J/mol, Molar quality
assert(InputPair.HmolarQ_INPUTS == HmolarQ_INPUTS);

%% HmassQ_INPUTS << Enthalpy in J/kg, Molar quality
assert(InputPair.HmassQ_INPUTS == HmassQ_INPUTS);

%% DmolarQ_INPUTS << Density in mol/m^3, Molar quality
assert(InputPair.DmolarQ_INPUTS == DmolarQ_INPUTS);

%% DmassQ_INPUTS << Density in kg/m^3, Molar quality
assert(InputPair.DmassQ_INPUTS == DmassQ_INPUTS);

%% PT_INPUTS << Pressure in Pa, Temperature in K
assert(InputPair.PT_INPUTS == PT_INPUTS);

%% DmassT_INPUTS << Mass density in kg/m^3, Temperature in K
assert(InputPair.DmassT_INPUTS == DmassT_INPUTS);

%% DmolarT_INPUTS << Molar density in mol/m^3, Temperature in K
assert(InputPair.DmolarT_INPUTS == DmolarT_INPUTS);

%% HmolarT_INPUTS << Enthalpy in J/mol, Temperature in K
assert(InputPair.HmolarT_INPUTS == HmolarT_INPUTS);

%% HmassT_INPUTS << Enthalpy in J/kg, Temperature in K
assert(InputPair.HmassT_INPUTS == HmassT_INPUTS);

%% SmolarT_INPUTS << Entropy in J/mol/K, Temperature in K
assert(InputPair.SmolarT_INPUTS == SmolarT_INPUTS);

%% SmassT_INPUTS << Entropy in J/kg/K, Temperature in K
assert(InputPair.SmassT_INPUTS == SmassT_INPUTS);

%% TUmolar_INPUTS << Temperature in K, Internal energy in J/mol
assert(InputPair.TUmolar_INPUTS == TUmolar_INPUTS);

%% TUmass_INPUTS << Temperature in K, Internal energy in J/kg
assert(InputPair.TUmass_INPUTS == TUmass_INPUTS);

%% DmassP_INPUTS << Mass density in kg/m^3, Pressure in Pa
assert(InputPair.DmassP_INPUTS == DmassP_INPUTS);

%% DmolarP_INPUTS << Molar density in mol/m^3, Pressure in Pa
assert(InputPair.DmolarP_INPUTS == DmolarP_INPUTS);

%% HmassP_INPUTS << Enthalpy in J/kg, Pressure in Pa
assert(InputPair.HmassP_INPUTS == HmassP_INPUTS);

%% HmolarP_INPUTS << Enthalpy in J/mol, Pressure in Pa
assert(InputPair.HmolarP_INPUTS == HmolarP_INPUTS);

%% PSmass_INPUTS << Pressure in Pa, Entropy in J/kg/K
assert(InputPair.PSmass_INPUTS == PSmass_INPUTS);

%% PSmolar_INPUTS << Pressure in Pa, Entropy in J/mol/K
assert(InputPair.PSmolar_INPUTS == PSmolar_INPUTS);

%% PUmass_INPUTS << Pressure in Pa, Internal energy in J/kg
assert(InputPair.PUmass_INPUTS == PUmass_INPUTS);

%% PUmolar_INPUTS << Pressure in Pa, Internal energy in J/mol
assert(InputPair.PUmolar_INPUTS == PUmolar_INPUTS);

%% HmassSmass_INPUTS << Enthalpy in J/kg, Entropy in J/kg/K
assert(InputPair.HmassSmass_INPUTS == HmassSmass_INPUTS);

%% HmolarSmolar_INPUTS << Enthalpy in J/mol, Entropy in J/mol/K
assert(InputPair.HmolarSmolar_INPUTS == HmolarSmolar_INPUTS);

%% SmassUmass_INPUTS << Entropy in J/kg/K, Internal energy in J/kg
assert(InputPair.SmassUmass_INPUTS == SmassUmass_INPUTS);

%% SmolarUmolar_INPUTS << Entropy in J/mol/K, Internal energy in J/mol
assert(InputPair.SmolarUmolar_INPUTS == SmolarUmolar_INPUTS);

%% DmassHmass_INPUTS << Mass density in kg/m^3, Enthalpy in J/kg
assert(InputPair.DmassHmass_INPUTS == DmassHmass_INPUTS);

%% DmolarHmolar_INPUTS << Molar density in mol/m^3, Enthalpy in J/mol
assert(InputPair.DmolarHmolar_INPUTS == DmolarHmolar_INPUTS);

%% DmassSmass_INPUTS << Mass density in kg/m^3, Entropy in J/kg/K
assert(InputPair.DmassSmass_INPUTS == DmassSmass_INPUTS);

%% DmolarSmolar_INPUTS << Molar density in mol/m^3, Entropy in J/mol/K
assert(InputPair.DmolarSmolar_INPUTS == DmolarSmolar_INPUTS);

%% DmassUmass_INPUTS << Mass density in kg/m^3, Internal energy in J/kg
assert(InputPair.DmassUmass_INPUTS == DmassUmass_INPUTS);

%% DmolarUmolar_INPUTS << Molar density in mol/m^3, Internal energy in J/mol
assert(InputPair.DmolarUmolar_INPUTS == DmolarUmolar_INPUTS);

