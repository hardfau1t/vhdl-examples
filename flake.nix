{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = system; };
    in
    {

      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          nushell
          ghdl
          gtkwave
        ];
        shellHook = "exec nu";
      };
    };
}
