classdef AbstractState < handle

    properties
        backend; % (char[]) name of CoolProp backend to use (e.g., 'HEOS')
        fluid; % (char[]) name(s) of fluid(s)
        err_code; % (int) latest error code produced by calling libary functions
        err_msg; % (char[]) error message
    end

    properties (Constant, Access = private)
        ERR_DEFAULT = 0;
        BUFF_SIZE = 2000;
        ERR_BUFFER = char(1:CoolProp.AbstractState.BUFF_SIZE);
    end

    properties (Access = private)
        % (int) memory reference to AbstractState object
        handle;
    end

    methods

        %% CONSTRUCTOR
        function self = AbstractState(backend, fluid)

            self.backend = backend;
            self.fluid = fluid;
            self.err_code = 0;
            self.err_msg = '';

            if ~libisloaded(CoolProp.CoolProp.ALIAS)
                CoolProp.CoolProp.load();
            end

            [self.handle, ~, ~, self.err_code, self.err_msg] = ...
                calllib(CoolProp.CoolProp.ALIAS, ...
                'AbstractState_factory', backend, fluid, ...
                self.ERR_DEFAULT, self.ERR_BUFFER, self.BUFF_SIZE);

        end

        %% DESTRUCTOR
        function delete(self)

            [self.err_code, self.err_msg] = calllib(...
                CoolProp.CoolProp.ALIAS, 'AbstractState_free', ...
                self.handle, self.ERR_DEFAULT, self.ERR_BUFFER, ...
                self.BUFF_SIZE);

        end

        %% MUTATORS

        function update(self, input_pair, value1, value2)

            [self.err_code, self.err_msg] = calllib(...
                CoolProp.CoolProp.ALIAS, 'AbstractState_update', ...
                self.handle, input_pair, value1, value2, ...
                self.ERR_DEFAULT, self.ERR_BUFFER, self.BUFF_SIZE);

        end

        function set_fractions(self, fractions)

            num_frac = length(fractions);
            [~, self.err_code, self.err_msg] = calllib(...
                CoolProp.CoolProp.ALIAS, 'AbstractState_set_fractions', ...
                self.handle, fractions, num_frac, ...
                self.ERR_DEFAULT, self.ERR_BUFFER, self.BUFF_SIZE);

        end

        function specify_phase(self, phase)

            phase = CoolProp.Phase.index_to_string(phase);
            [~, self.err_code, self.err_msg] = calllib( ...
                CoolProp.CoolProp.ALIAS, 'AbstractState_specify_phase', ...
                self.handle, phase, self.ERR_DEFAULT, ...
                self.ERR_BUFFER, self.BUFF_SIZE);

        end

        function unspecify_phase(self)

            [self.err_code, self.err_msg] = calllib( ...
                CoolProp.CoolProp.ALIAS, ...
                'AbstractState_unspecify_phase', self.handle, phase, ...
                self.ERR_DEFAULT, self.ERR_BUFFER, self.BUFF_SIZE);

        end


        %% ACCESSORS

        function components = get_fluid_components(self)

            components = strsplit(self.fluid, '&');

        end

        function fracs = get_fractions(self)

            components = self.get_fluid_components();
            num_components = length(components);
            fracs = zeros(size(components));
            num_fracs = length(components);

            [fracs, ~, self.err_code, self.err_msg] = calllib(...
                CoolProp.CoolProp.ALIAS, ...
                'AbstractState_get_mole_fractions', self.handle, ...
                fracs, num_fracs, num_components, self.ERR_DEFAULT, ...
                self.ERR_BUFFER, self.BUFF_SIZE);

        end

        function value = keyed_output(self, param)

            [value, self.err_code, self.err_msg] = calllib(...
                CoolProp.CoolProp.ALIAS, 'AbstractState_keyed_output', ...
                self.handle, param, self.ERR_DEFAULT, self.ERR_BUFFER, ...
                self.BUFF_SIZE);

        end

        % General parameters
        function value = gas_constant(self)
            value = self.keyed_output(CoolProp.Parameter.igas_constant);
        end

        function value = molar_mass(self)
            value = self.keyed_output(CoolProp.Parameter.imolar_mass);
        end

        function value = acentric_factor(self)
            value = self.keyed_output(CoolProp.Parameter.iacentric_factor);
        end

        function value = rhomolar_reducing(self)
            value = self.keyed_output(CoolProp.Parameter.irhomolar_reducing);
        end

        function value = rhomolar_critical(self)
            value = self.keyed_output(CoolProp.Parameter.irhomolar_critical);
        end

        function value = T_reducing(self)
            value = self.keyed_output(CoolProp.Parameter.iT_reducing);
        end

        function value = T_critical(self)
            value = self.keyed_output(CoolProp.Parameter.iT_critical);
        end

        function value = rhomass_critical(self)
            value = self.keyed_output(CoolProp.Parameter.irhomass_critical);
        end

        function value = rhomass_reducing(self)
            value = self.keyed_output(CoolProp.Parameter.irhomass_reducing);
        end

        function value = p_critical(self)
            value = self.keyed_output(CoolProp.Parameter.iP_critical);
        end

        function value = p_reducing(self)
            value = self.keyed_output(CoolProp.Parameter.iP_reducing);
        end

        function value = T_triple(self)
            value = self.keyed_output(CoolProp.Parameter.iT_triple);
        end

        function value = p_triple(self)
            value = self.keyed_output(CoolProp.Parameter.iP_triple);
        end

        function value = Tmin(self)
            value = self.keyed_output(CoolProp.Parameter.iT_min);
        end

        function value = Tmax(self)
            value = self.keyed_output(CoolProp.Parameter.iT_max);
        end

        function value = Pmin(self)
            value = self.keyed_output(CoolProp.Parameter.iP_min);
        end

        function value = Pmax(self)
            value = self.keyed_output(CoolProp.Parameter.iP_max);
        end

        function value = dipole_moment(self)
            value = self.keyed_output(CoolProp.Parameter.idipole_moment);
        end

        % Bulk properties
        function value = T(self)
            value = self.keyed_output(CoolProp.Parameter.iT);
        end

        function value = p(self)
            value = self.keyed_output(CoolProp.Parameter.iP);
        end

        function value = Q(self)
            value = self.keyed_output(CoolProp.Parameter.iQ);
        end

        function value = Tau(self)
            value = self.keyed_output(CoolProp.Parameter.iTau);
        end

        function value = Delta(self)
            value = self.keyed_output(CoolProp.Parameter.iDelta);
        end

        % Molar specific thermodynamic properties
        function value = rhomolar(self)
            value = self.keyed_output(CoolProp.Parameter.iDmolar);
        end

        function value = hmolar(self)
            value = self.keyed_output(CoolProp.Parameter.iHmolar);
        end

        function value = smolar(self)
            value = self.keyed_output(CoolProp.Parameter.iSmolar);
        end

        function value = cpmolar(self)
            value = self.keyed_output(CoolProp.Parameter.iCpmolar);
        end

        function value = cp0molar(self)
            value = self.keyed_output(CoolProp.Parameter.iCp0molar);
        end

        function value = cvmolar(self)
            value = self.keyed_output(CoolProp.Parameter.iCvmolar);
        end

        function value = umolar(self)
            value = self.keyed_output(CoolProp.Parameter.iUmolar);
        end

        function value = gibbsmolar(self)
            value = self.keyed_output(CoolProp.Parameter.iGmolar);
        end

        function value = helmholtzmolar(self)
            value = self.keyed_output(CoolProp.Parameter.iHelmholtzmolar);
        end

        function value = hmolar_residual(self)
            value = self.keyed_output(CoolProp.Parameter.iHmolar_residual);
        end

        function value = smolar_residual(self)
            value = self.keyed_output(CoolProp.Parameter.iSmolar_residual);
        end

        function value = gibbsmolar_residual(self)
            value = self.keyed_output(CoolProp.Parameter.iGmolar_residual);
        end

        % Mass Specific thermodynamic properties

        function value = rhomass(self)
            value = self.keyed_output(CoolProp.Parameter.iDmass);
        end

        function value = hmass(self)
            value = self.keyed_output(CoolProp.Parameter.iHmass);
        end

        function value = smass(self)
            value = self.keyed_output(CoolProp.Parameter.iSmass);
        end

        function value = cpmass(self)
            value = self.keyed_output(CoolProp.Parameter.iCpmass);
        end

        function value = cp0mass(self)
            value = self.keyed_output(CoolProp.Parameter.iCp0mass);
        end

        function value = cvmass(self)
            value = self.keyed_output(CoolProp.Parameter.iCvmass);
        end

        function value = umass(self)
            value = self.keyed_output(CoolProp.Parameter.iUmass);
        end

        function value = gibbsmass(self)
            value = self.keyed_output(CoolProp.Parameter.iGmass);
        end

        function value = helmholtzmass(self)
            value = self.keyed_output(CoolProp.Parameter.iHelmholtzmass);
        end

        % Transport properties
        function value = viscosity(self)
            value = self.keyed_output(CoolProp.Parameter.iviscosity);
        end

        function value = conductivity(self)
            value = self.keyed_output(CoolProp.Parameter.iconductivity);
        end

        function value = surface_tension(self)
            value = self.keyed_output(CoolProp.Parameter.isurface_tension);
        end

        function value = Prandtl(self)
            value = self.keyed_output(CoolProp.Parameter.iPrandtl);
        end

        % Derivative-based terms
        function value = speed_sound(self)
            value = self.keyed_output(CoolProp.Parameter.ispeed_sound);
        end

        function value = isothermal_compressibility(self)
            value = self.keyed_output(CoolProp.Parameter.iisothermal_compressibility);
        end

        function value = isobaric_expansion_coefficient(self)
            value = self.keyed_output(CoolProp.Parameter.iisobaric_expansion_coefficient);
        end

        function value = isentropic_expansion_coefficient(self)
            value = self.keyed_output(CoolProp.Parameter.iisentropic_expansion_coefficient);
        end

        % Fundamental derivative of gas dynamics
        function value = fundamental_derivative_of_gas_dynamics(self)
            value = self.keyed_output(CoolProp.Parameter.ifundamental_derivative_of_gas_dynamics);
        end

        % Other functions and derivatives
        function value = Bvirial(self)
            value = self.keyed_output(CoolProp.Parameter.iBvirial);
        end

        function value = Cvirial(self)
            value = self.keyed_output(CoolProp.Parameter.iCvirial);
        end

        function value = compressibility_factor(self)
            value = self.keyed_output(CoolProp.Parameter.iZ);
        end

        function value = PIP(self)
            value = self.keyed_output(CoolProp.Parameter.iPIP);
        end

        function value = phase(self)
            value = self.keyed_output(CoolProp.Parameter.iPhase);
        end

    end

end
