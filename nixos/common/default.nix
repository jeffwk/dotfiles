{ lib, ... }:
with lib.my; {
  imports = importModules [
    ./emacs.nix
    ./python.nix
    ./ruby.nix
    ./system.nix
    ./postgres.nix
  ];
}
