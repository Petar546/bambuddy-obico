{
  description = "Dev env for Obico 3D & Bambu A2L Bridge Proxy";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            podman
            podman-compose
            git
          ];

          shellHook = ''
            echo "Available commands:"
            echo "  - podman play kube obico-stack.yaml --configmap obico.env   (Start stack)"
            echo "  - podman pod rm -f obico-pod                                (Stop stack)"
          '';
        };
      }
    );
}
