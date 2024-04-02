classdef CoolProp

    properties (Constant)

        ALIAS = 'coolprop';

    end

    methods (Static)

        function load()

            if libisloaded(CoolProp.CoolProp.ALIAS)
                disp('CoolProp is already loaded')
                return
            end

            path_to_lib = CoolProp.CoolProp.getLibPath();
            path_to_header = CoolProp.CoolProp.getHeaderPath();
            loadlibrary(path_to_lib, path_to_header, 'alias', CoolProp.CoolProp.ALIAS);

        end

        function unload()

            if ~libisloaded(CoolProp.CoolProp.ALIAS)
                disp('CoolProp is not loaded')
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

    end

    methods (Static, Access = private)

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
