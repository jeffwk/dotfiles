{ lib, ... }:
let
  inherit (lib) mkOption types;
  inherit (lib.my.options) mkBoolOpt;
in {
  options = {
    local = {
      nix-repo-path = mkOption {
        type = with types; nullOr string;
        default = null;
      };
      primary-user = {
        username = mkOption {
          type = with types; nullOr string;
          default = null;
        };
        full-name = mkOption {
          type = with types; nullOr string;
          default = null;
        };
        email = mkOption {
          type = with types; nullOr string;
          default = null;
        };
      };
      emacs = {
        enable = mkBoolOpt true;
        install-home = mkBoolOpt false;
      };
      gui = mkBoolOpt true;
      optimize = mkBoolOpt true;
      printing = mkBoolOpt false;
      docker = mkBoolOpt false;
      cloud = mkBoolOpt false;
    };
  };
}
