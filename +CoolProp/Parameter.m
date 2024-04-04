classdef Parameter
    % Parameter indicies based on parameters enum at
    % https://github.com/CoolProp/CoolProp/blob/master/include/DataStructures.h#L64
    % Not all parameters are currently included

    properties (Constant)

        % General parameters
        igas_constant      = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'gas_constant')      % Molar gas constant in J/mol/K (O)
        imolar_mass        = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'molar_mass')        % Molar mass in kg/mol (O)
        iacentric_factor   = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'acentric')          % Acentric factor in - (O)
        irhomolar_reducing = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'rhomolar_reducing') % Molar density at reducing point in mol/m^3 (O)
        irhomolar_critical = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'rhomolar_critical') % Molar density at critical point in mol/m^3 (O)
        iT_reducing        = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'T_reducing')        % Temperature at the reducing point in K (O)
        iT_critical        = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'T_critical')        % Temperature at the critical point in K (O)
        irhomass_reducing  = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'rhomass_reducing')  % Mass density at reducing point in kg/m^3 (O)
        irhomass_critical  = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'rhomass_critical')  % Mass density at critical point in kg/m^3 (O)
        iP_critical        = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'p_critical')        % Pressure at the critical point in Pa (O)
        iP_reducing        = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'p_reducing')        % Pressure at the reducing point in Pa (O)
        iT_triple          = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'T_triple')          % Temperature at the triple point in K (O)
        iP_triple          = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'p_triple')          % Pressure at the triple point (pure only) in Pa (O)
        iT_min             = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'T_min')             % Minimum temperature limit in K (O)
        iT_max             = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'T_max')             % Maximum temperature limit in K (O)
        iP_max             = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'P_max')             % Maximum pressure limit in Pa (O)
        iP_min             = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'P_min')             % Minimum pressure limit in Pa (O)
        idipole_moment     = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'dipole_moment')     % Dipole moment in C-m (O)

        % Bulk properties
        iT     = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'T')     % Temperature in K (IO)
        iP     = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'P')     % Pressure in Pa (IO)
        iQ     = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Q')     % Molar vapor quality in mol/mol (IO)
        iTau   = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Tau')   % Reciprocal reduced temperature (Tc/T) in - (IO)
        iDelta = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Delta') % Reduced density (rho/rhoc) in - (IO)

        % Molar specific thermodynamic properties
        iDmolar          = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Dmolar')          % Molar density in mol/m^3 (IO)
        iHmolar          = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Hmolar')          % Molar specific enthalpy in J/mol (IO)
        iSmolar          = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Smolar')          % Molar specific entropy in J/mol/K (IO)
        iCpmolar         = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Cpmolar')         % Molar specific constant pressure specific heat in J/mol/K (O)
        iCp0molar        = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Cp0molar')        % Ideal gas molar specific constant pressure specific heat in J/mol/K (O)
        iCvmolar         = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Cvmolar')         % Molar specific constant volume specific heat in J/mol/K (O)
        iUmolar          = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Umolar')          % Molar specific internal energy in J/mol (IO)
        iGmolar          = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Gmolar')          % Molar specific Gibbs energy in J/mol (O)
        iHelmholtzmolar  = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Helmholtzmolar')  % Molar specific Helmholtz energy in J/mol (O)
        iHmolar_residual = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Hmolar_residual') % Residual molar enthalpy in J/mol/K (O)
        iSmolar_residual = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Smolar_residual') % Residual molar entropy (sr/R = s(T,rho) - s^0(T,rho)) in J/mol/K (O)
        iGmolar_residual = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Gmolar_residual') % Residual molar Gibbs energy in J/mol/K (O)

        % Mass specific thermodynamic properties
        iDmass          = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Dmass')         % Mass density in kg/m^3 (IO)
        iHmass          = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Hmass')         % Mass specific enthalpy in J/kg (IO)
        iSmass          = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Smass')         % Mass specific entropy in J/kg/K (IO)
        iCpmass         = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Cpmass')        % Mass specific constant pressure specific heat in J/kg/K (O)
        iCp0mass        = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Cp0mass')       % Ideal gas mass specific constant pressure specific heat in J/kg/K (O)
        iCvmass         = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Cvmass')        % Mass specific constant volume specific heat in J/kg/K (O)
        iUmass          = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Umass')         % Mass specific internal energy in J/kg (IO)
        iGmass          = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Gmass')         % Mass specific Gibbs energy in J/kg (O)
        iHelmholtzmass  = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Helmholtzmass') % Mass specific Helmholtz energy in J/kg (O)

        % Transport properties
        iviscosity       = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'viscosity')       % Viscosity in Pa-s (O)
        iconductivity    = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'conductivity')    % Thermal conductivity in W/m/K (O)
        isurface_tension = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'surface_tension') % Surface tension in N/m (O)
        iPrandtl         = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Prandtl')         % Prandtl number in - (O)

        % Derivative-based terms
        ispeed_sound                      = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'speed_of_sound')                   % Speed of sound in m/s (O)
        iisothermal_compressibility       = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'isothermal_compressibility')       % Isothermal compressibility in 1/Pa (O)
        iisobaric_expansion_coefficient   = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'isobaric_expansion_coefficient')   % Isobaric expansion coefficient in 1/K (O)
        iisentropic_expansion_coefficient = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'isentropic_expansion_coefficient') % Isentropic expansion coefficient in - (O)

        % Fundamental derivative of gas dynamics
        ifundamental_derivative_of_gas_dynamics = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'fundamental_derivative_of_gas_dynamics') % Fundamental derivative of gas dynamics in - (O)

        % Derivatives of the residual non-dimensionalized Helmholtz energy with respect to the EOS variables
        ialphar                  = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'alphar')                  % Residual Helmholtz energy in - (O)
        idalphar_dtau_constdelta = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'dalphar_dtau_constdelta') % Derivative of residual Helmholtz energy with tau in - (O)
        idalphar_ddelta_consttau = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'dalphar_ddelta_consttau') % Derivative of residual Helmholtz energy with delta in - (O)

        % Derivatives of the ideal-gas non-dimensionalized Helmholtz energy with respect to the EOS variables
        ialpha0                    = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'alpha0')                    % Ideal Helmholtz energy in - (O)
        idalpha0_dtau_constdelta   = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'dalpha0_dtau_constdelta')   % Derivative of ideal Helmholtz energy with tau in - (O)
        idalpha0_ddelta_consttau   = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'dalpha0_ddelta_consttau')   % Derivative of ideal Helmholtz energy with delta in - (O)
        id2alpha0_ddelta2_consttau = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'd2alpha0_ddelta2_consttau') % Second derivative of ideal Helmholtz energy with delta in - (O)
        id3alpha0_ddelta3_consttau = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'd3alpha0_ddelta3_consttau') % Third derivative of ideal Helmholtz energy with delta in - (O)

        % Other functions and derivatives
        iBvirial     = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Bvirial')     % Second virial coefficient in - (O)
        iCvirial     = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Cvirial')     % Third virial coefficient in - (O)
        idBvirial_dT = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'dBvirial_dT') % Derivative of second virial coefficient with respect to T in - (O)
        idCvirial_dT = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'dCvirial_dT') % Derivative of third virial coefficient with respect to T in - (O)
        iZ           = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Z')           % Compressibility factor in - (O)
        iPIP         = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'PIP')         % Phase identification parameter in - (O)

        % Accessors for incompressibles
        ifraction_min = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'fraction_min') % Fraction (mole, mass, volume) minimum value for incompressible solutions in - (O)
        ifraction_max = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'fraction_max') % Fraction (mole, mass, volume) maximum value for incompressible solutions in - (O)
        iT_freeze     = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'T_freeze')     % Freezing temperature for incompressible solutions in K (O)

        % Environmental parameters
        iGWP20  = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'GWP20')  % 20-year global warming potential in - (O)
        iGWP100 = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'GWP100') % 100-year global warming potential in - (O)
        iGWP500 = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'GWP500') % 500-year global warming potential in - (O)
        iFH     = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'FH')     % Flammability hazard in - (O)
        iHH     = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'HH')     % Health hazard in - (O)
        iPH     = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'PH')     % Physical hazard in - (O)
        iODP    = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'ODP')    % Ozone depletion potential in - (O)
        iPhase  = calllib(CoolProp.CoolProp.ALIAS, 'get_param_index', 'Phase')  % Phase index as a float in - (O)

    end

end
