{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.my;
let
  inherit (config) user host modules;
  inherit (modules) dev;
  rubyPackages = (ps:
    with ps; [
      ffi
      glib2
      sqlite3
      pkg-config
      rake
      native-package-installer
      pango
      curses
      rexml
      terminal-table
      gtk3
      sequel
    ]);
  rubyCustom = pkgs.ruby_3_2.withPackages rubyPackages;
  cfg = config.modules.dev.ruby;
in {
  options.modules.dev.ruby = { enable = mkBoolOpt dev.enable-all; };

  config = mkIf cfg.enable {
    environment.systemPackages = [ rubyCustom ];
    home-manager.users.${user.name} = { };
  };
}
