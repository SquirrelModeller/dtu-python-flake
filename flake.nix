{
  description = "DTU Python development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);

      mkPkgs = system: import nixpkgs { inherit system; };
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = mkPkgs system;

          sympy-plot-backends = pkgs.python312Packages.buildPythonPackage rec {
            pname = "sympy_plot_backends";
            version = "3.2.0";
            format = "wheel";

            src = pkgs.fetchPypi {
              inherit pname version format;
              dist = "py3";
              python = "py3";
              sha256 = "sha256-HbeYR08eMqW2B8m/43m3L/mbOVC0AULYREgj7X/ikYM=";
            };

            propagatedBuildInputs = with pkgs.python312Packages; [
              sympy
              numpy
              matplotlib
              appdirs
              mergedeep
              param
            ];

            doCheck = false;
          };

          dtumathtools = pkgs.python312Packages.buildPythonPackage rec {
            pname = "dtumathtools";
            version = "2024.2.0";
            format = "wheel";

            src = pkgs.fetchPypi {
              inherit pname version format;
              dist = "py3";
              python = "py3";
              sha256 = "sha256-IB+6MzskiYLoCgi0/qzGKOrm5GPVdA96hl25FNnn1xM=";
            };

            propagatedBuildInputs = with pkgs.python312Packages; [
              numpy
              matplotlib
              ipykernel
              sympy-plot-backends
            ];

            doCheck = false;
          };

          pythonEnv = pkgs.python312.withPackages (ps: with ps; [
            ipykernel
            jupyter
            jupyterlab
            notebook

            numpy
            pandas
            matplotlib
            sympy
            scipy

            dtumathtools
          ]);
        in
        {
          default = pkgs.mkShell {
            packages = [
              pythonEnv
              pkgs.python312Packages.pip
            ];
          };
        }
      );
    };
}