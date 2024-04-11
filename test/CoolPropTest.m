% CoolPropTest Test of static methods in CoolProp.CoolProp class

import CoolProp.*

%% Library path default

want = [getenv('APPDATA') '\CoolProp\CoolProp.dll'];
got = CoolProp.defaultLibLocation();

assert(strcmp(want, got))

%% Header path default

want = [getenv('APPDATA') '\CoolProp\CoolPropLib.h'];
got = CoolProp.defaultHeaderLocation();

assert(strcmp(want, got))

%% Getting and setting lib path
% Test getting default location when no path has been set

clear CoolProp %Clear static data in CoolProp

want = [getenv('APPDATA') '\CoolProp\CoolProp.dll'];
got = CoolProp.getLibPath();

assert(strcmp(want, got))

% Test setting a new location
new_want = fullfile('C:', 'CoolProp', 'CoolProp.dll');
CoolProp.setLibPath(new_want);
got = CoolProp.getLibPath();

assert(strcmp(new_want, got))

clear CoolProp %Clear static data in CoolProp

%% Getting and setting header path

clear CoolProp %Clear static data in CoolProp

% Test getting default location when no path has been set
want = [getenv('APPDATA') '\CoolProp\CoolPropLib.h'];
got = CoolProp.getHeaderPath();

assert(strcmp(want, got))

clear CoolProp %Clear static data in CoolProp

% Test setting a new location
new_want = fullfile('C:', 'CoolProp', 'CoolPropLib.h');
CoolProp.setHeaderPath(new_want);
got = CoolProp.getHeaderPath();

assert(strcmp(new_want, got))

clear CoolProp % clear static data in CoolProp

%% Getting and setting refprop location
clear CoolProp % clear static data in CoolProp

want = '';
got = CoolProp.getRefpropPath();
assert(strcmp(want, got))

new_want = fullfile('C:', 'CoolProp', filesep);
CoolProp.setRefpropPath(new_want);
got = CoolProp.getRefpropPath();
assert(strcmp(new_want, got))

clear CoolProp % clear static data in CoolProp

%% Getting and setting refprop location

clear CoolProp % clear static data in CoolProp

want = '';
got = CoolProp.getRefpropLibPath();
assert(strcmp(want, got))

new_want = fullfile('C:', 'CoolProp', 'REFPRP64.DLL');
CoolProp.setRefpropLibPath(new_want);
got = CoolProp.getRefpropLibPath();
assert(strcmp(new_want, got))

clear CoolProp

%% Loading CoolProp

if libisloaded(CoolProp.ALIAS)
    unloadlibrary(CoolProp.ALIAS);
end
CoolProp.load();
assert(libisloaded(CoolProp.ALIAS))

%% Unloading CoolProp

if ~libisloaded(CoolProp.ALIAS)
    CoolProp.load();
end
CoolProp.unload();
assert(~libisloaded(CoolProp.ALIAS))

%% Get CoolProp version

if ~libisloaded(CoolProp.ALIAS)
    CoolProp.load();
end

version_exp = '6.4.3';
version_got = CoolProp.get_global_param_string('version');
assert(strcmp(version_exp, version_got))

CoolProp.unload();

%% Props1SI

CoolProp.load();
molmass_exp = 0.018015268;
molmass_got = CoolProp.Props1SI('water', 'M');
assert(abs(molmass_exp - molmass_got) < 1e-6)
CoolProp.unload();

%% PropsSI

CoolProp.load();
temp_exp = 373.124295847701;
temp_got = CoolProp.PropsSI('T', 'P', 101325, 'Q', 0, 'water');
assert(abs(temp_exp - temp_got) < 1e-6)
CoolProp.unload();

%% HAPropsSI

if ~libisloaded(CoolProp.ALIAS)
    CoolProp.load();
end

enthalpy_exp = 50423.45039107799;
enthalpy_got = CoolProp.HAPropsSI('H', 'T', 298.15, 'P', 101325, 'R', 0.5);
assert(abs(enthalpy_exp - enthalpy_got) < 1e-6)

CoolProp.unload();

%% Loading custom CoolProp location

clear CoolProp
path_to_lib = fullfile('C:', 'CoolProp', ...
    {'6.4.3', '6.5.0', '6.6.0'}, 'CoolProp.dll');
path_to_header = fullfile('C:', 'CoolProp', 'CoolPropLib.h');

CoolProp.setLibPath(path_to_lib{1});
CoolProp.setHeaderPath(path_to_header);
CoolProp.load();

version_exp = '6.4.3';
version_got = CoolProp.get_global_param_string('version');
assert(strcmp(version_exp, version_got))

CoolProp.unload();

CoolProp.setLibPath(path_to_lib{2});
CoolProp.setHeaderPath(path_to_header);
CoolProp.load();

version_exp = '6.5.0';
version_got = CoolProp.get_global_param_string('version');
assert(strcmp(version_exp, version_got))

CoolProp.unload();

CoolProp.setLibPath(path_to_lib{3});
CoolProp.setHeaderPath(path_to_header);
CoolProp.load();

version_exp = '6.6.0';
version_got = CoolProp.get_global_param_string('version');
assert(strcmp(version_exp, version_got))

CoolProp.unload();

%% Calling REFPROP

if ispc
    [status, ~] = system('where REFPRP64.dll');
else
    [status, ~] = system('which REFPRP64.dll');
end

assert(status == 0, 'Could not find REFPROP on the OS search path, aborting test')

CoolProp.load();
temp_exp = 373.124295847701;
temp_got = CoolProp.PropsSI('T', 'P', 101325, 'Q', 0, 'REFPROP::Water');
assert(abs(temp_exp - temp_got) < 1e-6)
CoolProp.unload();

%% Calling custom REFPROP location

clear CoolProp

refprop_loc = fullfile('C:','foo', filesep());
refprop_lib_loc = fullfile('C:','foo', 'REFPRP64.dll');

CoolProp.setRefpropPath(refprop_loc);
CoolProp.setRefpropLibPath(refprop_lib_loc);
CoolProp.load();
CoolProp.configRefprop();

temp_exp = 373.124295847701;
temp_got = CoolProp.PropsSI('T', 'P', 101325, 'Q', 0, 'REFPROP::Water');
assert(abs(temp_exp - temp_got) < 1e-6)

CoolProp.unload();

clear CoolProp

