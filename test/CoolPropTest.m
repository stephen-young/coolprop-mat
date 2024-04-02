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

%% Getting and setting header path

clear CoolProp %Clear static data in CoolProp

% Test getting default location when no path has been set
want = [getenv('APPDATA') '\CoolProp\CoolPropLib.h'];
got = CoolProp.getHeaderPath();

assert(strcmp(want, got))

% Test setting a new location
new_want = fullfile('C:', 'CoolProp', 'CoolPropLib.h');
CoolProp.setHeaderPath(new_want);
got = CoolProp.getHeaderPath();

assert(strcmp(new_want, got))

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

