classdef Parameter < int32
    % Parameter indicies based on parameters enum at
    % https://github.com/CoolProp/CoolProp/blob/master/include/DataStructures.h#L64
    % Not all parameters are currently included

    enumeration

        igas_constant                           (1)    % Ideal-gas constant
        imolar_mass                             (2)    % Molar mass
        iacentric_factor                        (3)    % Acentric factor
        irhomolar_reducing                      (4)    % Molar density used for the reducing state
        irhomolar_critical                      (5)    % Molar density used for the critical point
        iT_reducing                             (6)    % Temperature at the reducing state
        iT_critical                             (7)    % Temperature at the critical point
        irhomass_reducing                       (8)    % Mass density at the reducing state
        irhomass_critical                       (9)    % Mass density at the critical point
        iP_critical                             (10)   % Pressure at the critical point
        iP_reducing                             (11)   % Pressure at the reducing point
        iT_triple                               (12)   % Triple point temperature
        iP_triple                               (13)   % Triple point pressure
        iT_min                                  (14)   % Minimum temperature
        iT_max                                  (15)   % Maximum temperature
        iP_max                                  (16)   % Maximum pressure
        iP_min                                  (17)   % Minimum pressure
        idipole_moment                          (18)   % Dipole moment
        iT                                      (19)   % Temperature
        iP                                      (20)   % Pressure
        iQ                                      (21)   % Vapor quality
        iTau                                    (22)   % Reciprocal reduced temperature
        iDelta                                  (23)   % Reduced density
        iDmolar                                 (24)   % Mole-based density
        iHmolar                                 (25)   % Mole-based enthalpy
        iSmolar                                 (26)   % Mole-based entropy
        iCpmolar                                (27)   % Mole-based constant-pressure specific heat
        iCp0molar                               (28)   % Mole-based ideal-gas constant-pressure specific heat
        iCvmolar                                (29)   % Mole-based constant-volume specific heat
        iUmolar                                 (30)   % Mole-based internal energy
        iGmolar                                 (31)   % Mole-based Gibbs energy
        iHelmholtzmolar                         (32)   % Mole-based Helmholtz energy
        iHmolar_residual                        (33)   % The residual molar enthalpy
        iSmolar_residual                        (34)   % The residual molar entropy (as a function of temperature and density)
        iGmolar_residual                        (35)   % The residual molar Gibbs energy
        iDmass                                  (36)   % Mass-based density
        iHmass                                  (37)   % Mass-based enthalpy
        iSmass                                  (38)   % Mass-based entropy
        iCpmass                                 (39)   % Mass-based constant-pressure specific heat
        iCp0mass                                (40)   % Mass-based ideal-gas specific heat
        iCvmass                                 (41)   % Mass-based constant-volume specific heat
        iUmass                                  (42)   % Mass-based internal energy
        iGmass                                  (43)   % Mass-based Gibbs energy
        iHelmholtzmass                          (44)   % Mass-based Helmholtz energy
        iviscosity                              (45)   % Viscosity
        iconductivity                           (46)   % Thermal conductivity
        isurface_tension                        (47)   % Surface tension
        iPrandtl                                (48)   % The Prandtl number
        ispeed_sound                            (49)   % Speed of sound
        iisothermal_compressibility             (50)   % Isothermal compressibility
        iisobaric_expansion_coefficient         (51)   % Isobaric expansion coefficient
        iisentropic_expansion_coefficient       (52)   % Isentropic expansion coefficient
        ifundamental_derivative_of_gas_dynamics (53)   % The fundamental derivative of gas dynamics
        ialphar                                 (54)
        idalphar_dtau_constdelta                (55)
        idalphar_ddelta_consttau                (56)
        ialpha0                                 (57)
        idalpha0_dtau_constdelta                (58)
        idalpha0_ddelta_consttau                (59)
        id2alpha0_ddelta2_consttau              (60)
        id3alpha0_ddelta3_consttau              (61)
        iBvirial                                (62)   % Second virial coefficient
        iCvirial                                (63)   % Third virial coefficient
        idBvirial_dT                            (64)   % Derivative of second virial coefficient with temperature
        idCvirial_dT                            (65)   % Derivative of third virial coefficient with temperature
        iZ                                      (66)   % The compressibility factor Z = p*v/(R*T)
        iPIP                                    (67)   % The phase identification parameter of Venkatarathnam and Oellrich
        ifraction_min                           (68)   % The minimum fraction (mole, mass, volume) for incompressibles
        ifraction_max                           (69)   % The maximum fraction (mole,mass,volume) for incompressibles
        iT_freeze                               (70)   % The freezing temperature for incompressibles
        iGWP20                                  (71)   % The 20-year global warming potential
        iGWP100                                 (72)   % The 100-year global warming potential
        iGWP500                                 (73)   % The 500-year global warming potential
        iFH                                     (74)   % Fire hazard index
        iHH                                     (75)   % Health hazard index
        iPH                                     (76)   % Physical hazard index
        iODP                                    (77)   % Ozone depletion potential (R-11 = 1.0)
        iPhase                                  (78)   % The phase index of the given state

    end

end
