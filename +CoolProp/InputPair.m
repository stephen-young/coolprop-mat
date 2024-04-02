classdef InputPair < int32
    % Parameter indicies based on input_pairs enum at
    % https://github.com/CoolProp/CoolProp/blob/master/include/DataStructures.h#L274
    % Not all parameters are currently included

    enumeration
        QT_INPUTS           (1) % Molar quality, Temperature in K
        PQ_INPUTS           (2) % Pressure in Pa, Molar quality
        QSmolar_INPUTS      (3) % Molar quality, Entropy in J/mol/K
        QSmass_INPUTS       (4) % Molar quality, Entropy in J/kg/K
        HmolarQ_INPUTS      (5) % Enthalpy in J/mol, Molar quality
        HmassQ_INPUTS       (6) % Enthalpy in J/kg, Molar quality
        DmolarQ_INPUTS      (7) % Density in mol/m^3, Molar quality
        DmassQ_INPUTS       (8) % Density in kg/m^3, Molar quality
        PT_INPUTS           (9) % Pressure in Pa, Temperature in K
        DmassT_INPUTS       (10) % Mass density in kg/m^3, Temperature in K
        DmolarT_INPUTS      (11) % Molar density in mol/m^3, Temperature in K
        HmolarT_INPUTS      (12) % Enthalpy in J/mol, Temperature in K
        HmassT_INPUTS       (13) % Enthalpy in J/kg, Temperature in K
        SmolarT_INPUTS      (14) % Entropy in J/mol/K, Temperature in K
        SmassT_INPUTS       (15) % Entropy in J/kg/K, Temperature in K
        TUmolar_INPUTS      (16) % Temperature in K, Internal energy in J/mol
        TUmass_INPUTS       (17) % Temperature in K, Internal energy in J/kg
        DmassP_INPUTS       (18) % Mass density in kg/m^3, Pressure in Pa
        DmolarP_INPUTS      (19) % Molar density in mol/m^3, Pressure in Pa
        HmassP_INPUTS       (20) % Enthalpy in J/kg, Pressure in Pa
        HmolarP_INPUTS      (21) % Enthalpy in J/mol, Pressure in Pa
        PSmass_INPUTS       (22) % Pressure in Pa, Entropy in J/kg/K
        PSmolar_INPUTS      (23) % Pressure in Pa, Entropy in J/mol/K
        PUmass_INPUTS       (24) % Pressure in Pa, Internal energy in J/kg
        PUmolar_INPUTS      (25) % Pressure in Pa, Internal energy in J/mol
        HmassSmass_INPUTS   (26) % Enthalpy in J/kg, Entropy in J/kg/K
        HmolarSmolar_INPUTS (27) % Enthalpy in J/mol, Entropy in J/mol/K
        SmassUmass_INPUTS   (28) % Entropy in J/kg/K, Internal energy in J/kg
        SmolarUmolar_INPUTS (29) % Entropy in J/mol/K, Internal energy in J/mol
        DmassHmass_INPUTS   (30) % Mass density in kg/m^3, Enthalpy in J/kg
        DmolarHmolar_INPUTS (31) % Molar density in mol/m^3, Enthalpy in J/mol
        DmassSmass_INPUTS   (32) % Mass density in kg/m^3, Entropy in J/kg/K
        DmolarSmolar_INPUTS (33) % Molar density in mol/m^3, Entropy in J/mol/K
        DmassUmass_INPUTS   (34) % Mass density in kg/m^3, Internal energy in J/kg
        DmolarUmolar_INPUTS (35) % Molar density in mol/m^3, Internal energy in J/mol

    end

end
