{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.my;
let
  inherit (config) user host modules;
  cfg = modules.wayland.hyprland;
  pwd = "${host.config-dir}/modules/linux/desktop/hyprland";
  optimize' = optimizePkg {
    enable = host.optimize;
    level = 2;
    native = true;
  };
in {
  options.modules.wayland.hyprland = {
    enable = mkBoolOpt modules.wayland.enable;
    extraConf = mkOpt types.str "";
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [
      inputs.hyprland.overlays.default
      inputs.hyprland.overlays.wlroots-hyprland
      inputs.hyprpaper.overlays.default
      (final: prev: {
        wlroots = optimize' prev.wlroots;
        wlroots-hyprland = optimize' prev.wlroots-hyprland;
        hyprland-unwrapped = optimize' (prev.hyprland-unwrapped.override {
          wlroots-hyprland = final.wlroots-hyprland;
        });
        hyprland = optimize' (prev.hyprland.override {
          wlroots-hyprland = final.wlroots-hyprland;
        });
        hyprpaper = optimize' prev.hyprpaper;
      })
    ];

    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [
      hypridle
      hyprlock
      hyprpaper
      hyprland-autoname-workspaces
      hyprkeys
    ];

    home-manager.users.${user.name} = { config, pkgs, ... }:
      let link = path: config.lib.file.mkOutOfStoreSymlink "${pwd}/${path}";
      in {
        xdg.configFile."hypr/hyprland.conf".source = link "hyprland.conf";
        xdg.configFile."hypr/hyprpaper.conf".source = link "hyprpaper.conf";
        xdg.configFile."hypr/hyprlock.conf".source = link "hyprlock.conf";
        xdg.configFile."hypr/mocha.conf".source = link "mocha.conf";
        xdg.configFile."hypr/hyprland.extra.conf".text = cfg.extraConf;

        xdg.configFile."hyprland-autoname-workspaces/config.toml".source =
          link "_autoname_config.toml";

        systemd.user.targets.hyprland-session = {
          Unit = {
            Description = "Hyprland compositor session";
            BindsTo = [ "graphical-session.target" ];
          };
        };

        systemd.user.services.ags.Install.WantedBy =
          mkIf modules.wayland.ags.enable [ "hyprland-session.target" ];

        systemd.user.services.avizo.Install.WantedBy =
          mkIf modules.wayland.avizo.enable [ "hyprland-session.target" ];

        systemd.user.services.lxqt-policykit-agent.Install.WantedBy =
          mkIf modules.wayland.enable [ "hyprland-session.target" ];

        systemd.user.services.hypridle = {
          Unit = {
            Description = "Idle manager for Hyprland compositor";
            PartOf = [ "graphical-session.target" ];
          };
          Install = { WantedBy = [ "hyprland-session.target" ]; };
          Service = {
            Type = "simple";
            ExecStart = "${pkgs.hypridle}/bin/hypridle";
            Restart = "always";
            RestartSec = 60;
            SyslogLevel = "debug";
          };
        };

        systemd.user.services.hyprpaper = {
          Unit = {
            Description = "Wallpaper service for Hyprland";
            PartOf = [ "graphical-session.target" ];
          };
          Install = { WantedBy = [ "hyprland-session.target" ]; };
          Service = {
            Type = "simple";
            ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
            SyslogLevel = "debug";
            LogLevelMax = "info";
            Restart = "always";
            RestartSec = 5;
          };
        };

        systemd.user.services.hyprland-autoname-workspaces = {
          Unit = {
            Description = "hyprland-autoname-workspaces service";
            PartOf = [ "graphical-session.target" ];
          };
          Install = { WantedBy = [ "hyprland-session.target" ]; };
          Service = {
            Type = "simple";
            ExecStart =
              "${pkgs.hyprland-autoname-workspaces}/bin/hyprland-autoname-workspaces";
          };
        };
      };
  };
}
