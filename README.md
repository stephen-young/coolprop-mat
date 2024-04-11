# Wrapper of `CoolProp` shared library for MATLAB

A wrapper of `CoolProp` for MATLAB that only uses the shared library interface
(`dll` or `so`).

## Purpose

In my experience, using the shared library interface of `CoolProp` reduced the
friction of being able to share MATLAB code with colleagues when they are
unfamiliar or do not have `python` installed. This package uses only shared
library functions to interface with `CoolProp` and enables easier sharing of
code.

## Features

- [x] High-level interface `PropsSI` function
- [x] Low-level `AbstractState` interface
- [x] `Props1SI`
- [x] `HAPropsSI`
- [x] Configurable paths to `CoolProp` and `REFPROP`

## Basic usage

This wrapper has tried to keep the API as similar to the `python` wrapper so
anyone familiar as practically as possible. The following code is how to
evaluate the density of water at 101325 Pa and 298.15 K using the high-level
and low-level interface:

```matlab
CoolProp.CoolProp.load();

%High-level interface
density = CoolProp.CoolProp.PropsSI('D', 'P', 101325, 'T', 298.15, 'water');

%Low-level interface
state = CoolProp.AbstractState('HEOS', 'water');
state.update(CoolProp.InputPair.PT_INPUTS, 101325, 298.15);
density = state.rhomass();
```

The `load()` static method of the `CoolProp` class will load the C library into
MATLAB. The function assumes a default location of `%APPDATA%\CoolProp` for
both the shared library and header file on Windows. On macOS and Linux,
`/usr/local/lib/` and `usr/local/include` are the default locations for the
shared library and header file, respectively.

If you would like to use paths that are different from the defaults, you could
do something like this:

```matlab
path_to_lib = fullfile('C:', 'CoolProp', 'CoolProp.dll');
path_to_header = fullfile('C:', 'CoolProp', 'CoolPropLib.h');
CoolProp.CoolProp.setLibPath(path_to_lib);
CoolProp.CoolProp.setHeaderPath(path_to_header);
CoolProp.CoolProp.load();
```

## Known Issues

- Attempting to access a fluid property of a mixture before fractions are set
  causes MATLAB to crash instead of return an error message with CoolProp v6.4.3

## Some notes on calling C Library from MATLAB

Running the following command below from the MATLAB command window will output the
full function signatures of the shared library that MATLAB will check against.

```matlab
loadlibrary('path/to/shared/library', 'path/to/CoolPropLib.h', 'alias', 'coolprop');
libfunctions('coolprop', '-full')
```

Functions that take pointers as arguments when called from MATLAB will be
available as optional return values to the function. You can also create
pointer objects in MATLAB but this approached has not been used in this
library with preference in using the MATLAB primitives instead.

For more information, [consult the MATLAB docs](https://www.mathworks.com/help/matlab/call-c-library-functions.html).
