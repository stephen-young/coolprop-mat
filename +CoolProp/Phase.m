classdef Phase
    % Phase indicies based on phases enum at
    % https://github.com/CoolProp/CoolProp/blob/master/include/DataStructures.h#L176

    properties (Constant)

        iphase_liquid               = 0 % Subcritical liquid
        iphase_supercritical        = 1 % Supercritical (p > pc, T > Tc)
        iphase_supercritical_gas    = 2 % Supercritical gas (p < pc, T > Tc)
        iphase_supercritical_liquid = 3 % Supercritical liquid (p > pc, T < Tc)
        iphase_critical_point       = 4 % At the critical point
        iphase_gas                  = 5 % Subcritical gas
        iphase_twophase             = 6 % Twophase
        iphase_unknown              = 7 % Unknown phase
        iphase_not_imposed          = 8 % Phase is not imposed

    end

end
