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

    methods (Static)

        function str = index_to_string(idx)
            % Phase indicator string from `phase_info_list` at:
            % https://github.com/CoolProp/CoolProp/blob/master/src/DataStructures.cpp#L361
            switch idx
                case 0
                    str = 'phase_liquid';
                case 1
                    str = 'phase_supercritical';
                case 2
                    str = 'phase_supercritical_gas';
                case 3
                    str = 'phase_supercritical_liquid';
                case 4
                    str = 'phase_critical_point';
                case 5
                    str = 'phase_gas';
                case 6
                    str = 'phase_two_phase';
                case 7
                    str = 'phase_unknown';
                case 8
                    str = 'phase_not_imposed';
                otherwise
                    str = 'phase_unknown';
            end
        end

    end

end
