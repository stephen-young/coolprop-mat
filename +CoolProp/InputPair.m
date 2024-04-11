classdef InputPair
    % Parameter indicies based on input_pairs enum at
    % https://github.com/CoolProp/CoolProp/blob/master/include/DataStructures.h#L274
    %
    % Property values will be evaluated after first reference to this class and cached
    % https://www.mathworks.com/help/matlab/matlab_oop/expressions-in-class-definitions.html

    properties (Constant)

        QT_INPUTS           = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'QT_INPUTS')            % Molar quality, Temperature in K
        PQ_INPUTS           = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'PQ_INPUTS');           % Pressure in Pa, Molar quality
        QSmolar_INPUTS      = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'QSmolar_INPUTS');      % Molar quality, Entropy in J/mol/K
        QSmass_INPUTS       = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'QSmass_INPUTS');       % Molar quality, Entropy in J/kg/K
        HmolarQ_INPUTS      = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'HmolarQ_INPUTS');      % Enthalpy in J/mol, Molar quality
        HmassQ_INPUTS       = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'HmassQ_INPUTS');       % Enthalpy in J/kg, Molar quality
        DmolarQ_INPUTS      = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'DmolarQ_INPUTS');      % Density in mol/m^3, Molar quality
        DmassQ_INPUTS       = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'DmassQ_INPUTS');       % Density in kg/m^3, Molar quality
        PT_INPUTS           = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'PT_INPUTS');           % Pressure in Pa, Temperature in K
        DmassT_INPUTS       = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'DmassT_INPUTS');       % Mass density in kg/m^3, Temperature in K
        DmolarT_INPUTS      = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'DmolarT_INPUTS');      % Molar density in mol/m^3, Temperature in K
        HmolarT_INPUTS      = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'HmolarT_INPUTS');      % Enthalpy in J/mol, Temperature in K
        HmassT_INPUTS       = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'HmassT_INPUTS');       % Enthalpy in J/kg, Temperature in K
        SmolarT_INPUTS      = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'SmolarT_INPUTS');      % Entropy in J/mol/K, Temperature in K
        SmassT_INPUTS       = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'SmassT_INPUTS');       % Entropy in J/kg/K, Temperature in K
        TUmolar_INPUTS      = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'TUmolar_INPUTS');      % Temperature in K, Internal energy in J/mol
        TUmass_INPUTS       = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'TUmass_INPUTS');       % Temperature in K, Internal energy in J/kg
        DmassP_INPUTS       = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'DmassP_INPUTS');       % Mass density in kg/m^3, Pressure in Pa
        DmolarP_INPUTS      = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'DmolarP_INPUTS');      % Molar density in mol/m^3, Pressure in Pa
        HmassP_INPUTS       = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'HmassP_INPUTS');       % Enthalpy in J/kg, Pressure in Pa
        HmolarP_INPUTS      = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'HmolarP_INPUTS');      % Enthalpy in J/mol, Pressure in Pa
        PSmass_INPUTS       = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'PSmass_INPUTS');       % Pressure in Pa, Entropy in J/kg/K
        PSmolar_INPUTS      = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'PSmolar_INPUTS');      % Pressure in Pa, Entropy in J/mol/K
        PUmass_INPUTS       = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'PUmass_INPUTS');       % Pressure in Pa, Internal energy in J/kg
        PUmolar_INPUTS      = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'PUmolar_INPUTS');      % Pressure in Pa, Internal energy in J/mol
        HmassSmass_INPUTS   = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'HmassSmass_INPUTS');   % Enthalpy in J/kg, Entropy in J/kg/K
        HmolarSmolar_INPUTS = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'HmolarSmolar_INPUTS'); % Enthalpy in J/mol, Entropy in J/mol/K
        SmassUmass_INPUTS   = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'SmassUmass_INPUTS');   % Entropy in J/kg/K, Internal energy in J/kg
        SmolarUmolar_INPUTS = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'SmolarUmolar_INPUTS'); % Entropy in J/mol/K, Internal energy in J/mol
        DmassHmass_INPUTS   = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'DmassHmass_INPUTS');   % Mass density in kg/m^3, Enthalpy in J/kg
        DmolarHmolar_INPUTS = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'DmolarHmolar_INPUTS'); % Molar density in mol/m^3, Enthalpy in J/mol
        DmassSmass_INPUTS   = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'DmassSmass_INPUTS');   % Mass density in kg/m^3, Entropy in J/kg/K
        DmolarSmolar_INPUTS = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'DmolarSmolar_INPUTS'); % Molar density in mol/m^3, Entropy in J/mol/K
        DmassUmass_INPUTS   = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'DmassUmass_INPUTS');   % Mass density in kg/m^3, Internal energy in J/kg
        DmolarUmolar_INPUTS = calllib(CoolProp.CoolProp.ALIAS, 'get_input_pair_index', 'DmolarUmolar_INPUTS'); % Molar density in mol/m^3, Internal energy in J/mol

    end

end
