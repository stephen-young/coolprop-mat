classdef CoolProp

    properties (Constant)

        ALIAS = 'coolprop';

    end

    methods (Static)

        function load()

            if libisloaded(CoolProp.CoolProp.ALIAS)
                return
            end

            path_to_lib = CoolProp.CoolProp.getLibPath();
            path_to_header = CoolProp.CoolProp.getHeaderPath();
            loadlibrary(path_to_lib, path_to_header, ...
                'alias', CoolProp.CoolProp.ALIAS);

        end

        function configRefprop()

            calllib(CoolProp.CoolProp.ALIAS, 'set_config_string', ...
                'ALTERNATIVE_REFPROP_PATH', ...
                CoolProp.CoolProp.getRefpropPath());

            calllib(CoolProp.CoolProp.ALIAS, 'set_config_string', ...
                'ALTERNATIVE_REFPROP_LIBRARY_PATH', ...
                CoolProp.CoolProp.getRefpropLibPath());

        end

        function unload()

            if ~libisloaded(CoolProp.CoolProp.ALIAS)
                return
            end

            unloadlibrary(CoolProp.CoolProp.ALIAS);

        end

        function setLibPath(path)
            CoolProp.CoolProp.libPath(path);
        end

        function path = getLibPath()
            path = CoolProp.CoolProp.libPath();
        end

        function setHeaderPath(path)
            CoolProp.CoolProp.headerPath(path);
        end

        function path = getHeaderPath()
            path = CoolProp.CoolProp.headerPath();
        end

        function setRefpropPath(path)
            CoolProp.CoolProp.refpropPath(path);
        end

        function path = getRefpropPath()
            path = CoolProp.CoolProp.refpropPath();
        end

        function setRefpropLibPath(path)
            CoolProp.CoolProp.refpropLibPath(path);
        end

        function path = getRefpropLibPath()
            path = CoolProp.CoolProp.refpropLibPath();
        end

        function path = defaultLibLocation()

            if ispc
                path = fullfile(getenv('APPDATA'), 'CoolProp', 'CoolProp.dll');
            elseif isunix
                path = fullfile('/', 'usr', 'lib', 'libCoolProp.so');
            else
                path = fullfile('/', 'usr', 'lib', 'libCoolProp.dylib');
            end

        end

        function path = defaultHeaderLocation()

            if ispc
                path = fullfile(getenv('APPDATA'), 'CoolProp');
            else
                path = fullfile('/', 'usr', 'include');
            end

            path = fullfile(path, 'CoolPropLib.h');

        end

        function outval = PropsSI(output, name_one, value_one, name_two,...
            value_two, fluid)

            outval = calllib(CoolProp.CoolProp.ALIAS, 'PropsSI', output,...
                name_one, value_one, name_two, value_two, fluid);

        end

    end

    methods (Static, Access = private)

        function path = refpropPath(path)

            persistent refprop_path;

            if isempty(refprop_path)
                refprop_path = '';
            end

            if nargin
                refprop_path = path;
                return
            end

            path = refprop_path;

        end

        function path = refpropLibPath(path)

            persistent refproplib_path;

            if isempty(refproplib_path)
                refproplib_path = '';
            end

            if nargin
                refproplib_path = path;
                return
            end

            path = refproplib_path;

        end

        function path = headerPath(path)

            persistent header_path;

            if isempty(header_path)
                % if header path has not been set, assign a default path
                header_path = CoolProp.CoolProp.defaultHeaderLocation();
            end

            if nargin
                header_path = path;
                return
            end

            path = header_path;

        end

        function path = libPath(path)

            persistent lib_path;

            if isempty(lib_path)
                % if lib path has not been set, assign a default path
                lib_path = CoolProp.CoolProp.defaultLibLocation();
            end

            if nargin
                lib_path = path;
                return
            end

            path = lib_path;

        end

    end

end
