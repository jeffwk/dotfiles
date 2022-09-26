{ config, lib, pkgs, ... }: {

  ### Services with WantedBy "sway.target" are started after loading the Sway
  ### config file, which manually activates "sway.target" at the end.

  xdg.configFile."sway/config".source = ../../dotfiles/sway/config;

  systemd.user.targets.sway = {
    Unit = {
      Description = "sway compositor session";
      BindsTo = [ "graphical-session.target" ];
      Wants = [ "graphical-session-pre.target" ];
      After = [ "graphical-session-pre.target" ];
    };
  };

  systemd.user.services.swayidle = {
    Unit = {
      Description = "Idle manager for Sway compositor";
      PartOf = [ "graphical-session.target" ];
      After = [ "sway.target" ];
    };
    Install = { WantedBy = [ "sway.target" ]; };
    Service = {
      Type = "simple";
      ExecCondition = ''${pkgs.bash}/bin/sh -c '[ -n "$WAYLAND_DISPLAY" ]' '';
      ExecStart = ''
        ${pkgs.swayidle}/bin/swayidle -w \
              timeout 1200   'swaylock-fancy --daemonize' \
              timeout 3600   'swaymsg "output * dpms off"' \
              resume         'swaymsg "output * dpms on"' \
              before-sleep   'swaylock-fancy --daemonize' \
            '';
      Restart = "always";
      RestartSec = 5;
    };
  };

  # systemd.user.services.ydotool = {
  #   Unit = {
  #     Description = "Starts ydotoold service";
  #     PartOf = [ "graphical-session.target" ];
  #     After = [ "sway.target" ];
  #   };
  #   Install = {
  #     WantedBy = [ "sway.target" ];
  #   };
  #   Service = {
  #     Type = "simple";
  #     Restart = "always";
  #     ExecStart = "${pkgs.ydotool}/bin/ydotoold";
  #     ExecReload = "${pkgs.util-linux}/bin/kill -HUP $MAINPID";
  #     KillMode = "process";
  #     TimeoutSec = 180;
  #   };
  # };

  home.packages = with pkgs; [
    swaybg
    swayidle
    swaylock
    swaylock-fancy # :: This is an swaylock bash script that takes a screenshot of the desktop, blurs the background and adds a lock icon and text
    swaytools
    swayr # :: A window switcher (and more) for sway
    swaywsr # :: Automatically change sway workspace names based on their contents
  ];
}
