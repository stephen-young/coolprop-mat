# `CoolProp` shared library signatures in MATALB

To get the full signatures of functions available in the `CoolProp` shared
library run the following in the MATLAB command window:

```matlab
loadlibrary('path/to/shared/library', 'path/to/CoolPropLib.h', 'alias', 'coolprop');
libfunctions('coolprop', '-full')
```

Functions in library `coolprop`:

```matlab
[doublePtr, doublePtr, doublePtr, longPtr, longPtr, cstring] AbstractState_all_critical_points(long, long, doublePtr, doublePtr, doublePtr, longPtr, longPtr, cstring, long)
[cstring, longPtr, cstring] AbstractState_backend_name(long, cstring, longPtr, cstring, long)
[cstring, longPtr, cstring] AbstractState_build_phase_envelope(long, cstring, longPtr, cstring, long)
[longPtr, cstring] AbstractState_build_spinodal(long, longPtr, cstring, long)
[long, cstring, cstring, longPtr, cstring] AbstractState_factory(cstring, cstring, longPtr, cstring, long)
[double, longPtr, cstring] AbstractState_first_partial_deriv(long, long, long, long, longPtr, cstring, long)
[double, longPtr, cstring] AbstractState_first_saturation_deriv(long, long, long, longPtr, cstring, long)
[cstring, longPtr, cstring] AbstractState_fluid_names(long, cstring, longPtr, cstring, long)
[longPtr, cstring] AbstractState_free(long, longPtr, cstring, long)
[doublePtr, longPtr, longPtr, cstring] AbstractState_get_mole_fractions(long, doublePtr, long, longPtr, longPtr, cstring, long)
[cstring, doublePtr, longPtr, longPtr, cstring] AbstractState_get_mole_fractions_satState(long, cstring, doublePtr, long, longPtr, longPtr, cstring, long)
[doublePtr, doublePtr, doublePtr, doublePtr, doublePtr, doublePtr, longPtr, cstring] AbstractState_get_phase_envelope_data(long, long, doublePtr, doublePtr, doublePtr, doublePtr, doublePtr, doublePtr, longPtr, cstring, long)
[doublePtr, doublePtr, doublePtr, doublePtr, doublePtr, doublePtr, longPtr, longPtr, longPtr, cstring] AbstractState_get_phase_envelope_data_checkedMemory(long, long, long, doublePtr, doublePtr, doublePtr, doublePtr, doublePtr, doublePtr, longPtr, longPtr, longPtr, cstring, long)
[doublePtr, doublePtr, doublePtr, longPtr, cstring] AbstractState_get_spinodal_data(long, long, doublePtr, doublePtr, doublePtr, longPtr, cstring, long)
[double, longPtr, cstring] AbstractState_keyed_output(long, long, longPtr, cstring, long)
[double, cstring, longPtr, cstring] AbstractState_keyed_output_satState(long, cstring, long, longPtr, cstring, long)
[cstring, longPtr, cstring] AbstractState_set_binary_interaction_double(long, long, long, cstring, double, longPtr, cstring, long)
[cstring, longPtr, cstring] AbstractState_set_cubic_alpha_C(long, long, cstring, double, double, double, longPtr, cstring, long)
[cstring, longPtr, cstring] AbstractState_set_fluid_parameter_double(long, long, cstring, double, longPtr, cstring, long)
[doublePtr, longPtr, cstring] AbstractState_set_fractions(long, doublePtr, long, longPtr, cstring, long)
[cstring, longPtr, cstring] AbstractState_specify_phase(long, cstring, longPtr, cstring, long)
[longPtr, cstring] AbstractState_unspecify_phase(long, longPtr, cstring, long)
[longPtr, cstring] AbstractState_update(long, long, double, double, longPtr, cstring, long)
[doublePtr, doublePtr, doublePtr, longPtr, cstring] AbstractState_update_and_1_out(long, long, doublePtr, doublePtr, long, long, doublePtr, longPtr, cstring, long)
[doublePtr, doublePtr, longPtr, doublePtr, doublePtr, doublePtr, doublePtr, doublePtr, longPtr, cstring] AbstractState_update_and_5_out(long, long, doublePtr, doublePtr, long, longPtr, doublePtr, doublePtr, doublePtr, doublePtr, doublePtr, longPtr, cstring, long)
[doublePtr, doublePtr, doublePtr, doublePtr, doublePtr, doublePtr, doublePtr, longPtr, cstring] AbstractState_update_and_common_out(long, long, doublePtr, doublePtr, long, doublePtr, doublePtr, doublePtr, doublePtr, doublePtr, longPtr, cstring, long)
double F2K(double)
[double, cstring, cstring, cstring, cstring] HAProps(cstring, cstring, double, cstring, double, cstring, double)
[double, cstring, cstring, cstring, cstring] HAPropsSI(cstring, cstring, double, cstring, double, cstring, double)
double K2F(double)
[long, cstring, cstring, cstring, cstring] PhaseSI(cstring, double, cstring, double, cstring, cstring, int32)
[double, cstring, cstring] Props(cstring, int8, double, int8, double, cstring)
[double, cstring, cstring] Props1(cstring, cstring)
[double, cstring, cstring] Props1SI(cstring, cstring)
[cstring, cstring, cstring, doublePtr, doublePtr, longPtr] Props1SImulti(cstring, cstring, cstring, doublePtr, long, doublePtr, longPtr)
[double, cstring, cstring, cstring, cstring] PropsS(cstring, cstring, double, cstring, double, cstring)
[double, cstring, cstring, cstring, cstring] PropsSI(cstring, cstring, double, cstring, double, cstring)
[cstring, cstring, doublePtr, cstring, doublePtr, cstring, cstring, doublePtr, doublePtr, longPtr, longPtr] PropsSImulti(cstring, cstring, doublePtr, long, cstring, doublePtr, long, cstring, cstring, doublePtr, long, doublePtr, longPtr, longPtr)
[cstring, cstring, longPtr, cstring] add_fluids_as_JSON(cstring, cstring, longPtr, cstring, long)
double cair_sat(double)
int32 get_debug_level
[long, cstring, cstring, cstring] get_fluid_param_string(cstring, cstring, cstring, int32)
[long, cstring, cstring] get_global_param_string(cstring, cstring, int32)
[long, cstring] get_input_pair_index(cstring)
[long, cstring] get_param_index(cstring)
[long, cstring, cstring] get_parameter_information_string(cstring, cstring, int32)
[cstring, cstring, doublePtr, cstring, doublePtr, cstring, doublePtr, doublePtr] haprops_(cstring, cstring, doublePtr, cstring, doublePtr, cstring, doublePtr, doublePtr)
[cstring, cstring, doublePtr, cstring, doublePtr, cstring, doublePtr, doublePtr] hapropssi_(cstring, cstring, doublePtr, cstring, doublePtr, cstring, doublePtr, doublePtr)
[cstring, cstring, doublePtr, cstring, doublePtr, cstring, doublePtr] propssi_(cstring, cstring, doublePtr, cstring, doublePtr, cstring, doublePtr)
[long, cstring] redirect_stdout(cstring)
[double, cstring, cstring, cstring] saturation_ancillary(cstring, cstring, int32, cstring, double)
cstring set_config_bool(cstring, bool)
cstring set_config_double(cstring, double)
[cstring, cstring] set_config_string(cstring, cstring)
set_debug_level(int32)
[cstring, longPtr, cstring] set_departure_functions(cstring, longPtr, cstring, long)
[int32, cstring] set_reference_stateD(cstring, double, double, double, double)
[int32, cstring, cstring] set_reference_stateS(cstring, cstring)
```
