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

%% Calling REFPROP

if ispc
    [status, ~] = system('where REFPRP64.dll');
else
    [status, ~] = system('which REFPRP64.dll');
end

assert(status == 0, 'Could not find REFPROP on the OS search path')

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

