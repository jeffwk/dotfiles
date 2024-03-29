{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.my;
let
  inherit (config) user host modules;
  inherit (host) darwin;
  inherit (pkgs) fetchpatch;
  cfg = config.modules.emacs;
  pwd = "${host.config-dir}/modules/emacs";

  emacsPkgs = (epkgs:
    with epkgs; [
      vterm
      all-the-icons
      treesit-grammars.with-all-grammars
    ]);

  emacs-base = optimize config (if darwin then
    pkgs.emacs-git.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [
        # Fix OS window role so that yabai can pick up emacs
        (fetchpatch {
          url =
            "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-28/fix-window-role.patch";
          sha256 = "sha256-+z/KfsBm1lvZTZNiMbxzXQGRTjkCFO4QPlEK35upjsE=";
        })
        # Use poll instead of select to get file descriptors
        (fetchpatch {
          url =
            "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-29/poll.patch";
          sha256 = "sha256-jN9MlD8/ZrnLuP2/HUXXEVVd6A+aRZNYFdZF8ReJGfY=";
        })
        # Enable rounded window with no decoration
        (fetchpatch {
          url =
            "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-30/round-undecorated-frame.patch";
          sha256 = "sha256-uYIxNTyfbprx5mCqMNFVrBcLeo+8e21qmBE3lpcnd+4=";
        })
        # Make emacs aware of OS-level light/dark mode
        (fetchpatch {
          url =
            "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-28/system-appearance.patch";
          sha256 = "sha256-oM6fXdXCWVcBnNrzXmF0ZMdp8j0pzkLE66WteeCutv8=";
        })
      ];
      configureFlags = (old.configureFlags or [ ])
        ++ [ "LDFLAGS=-headerpad_max_install_names" ];
    })
  else if modules.wayland.enable then
    pkgs.emacs29-pgtk
  else
    pkgs.emacs29-nox);
in {
  options.modules.emacs = {
    enable = mkBoolOpt false;
    install = mkBoolOpt cfg.enable;
    install-in-home = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [
      inputs.emacs-overlay.overlay
      (final: prev: {
        emacs = (prev.emacsPackagesFor emacs-base).emacsWithPackages emacsPkgs;
      })
    ];

    environment.systemPackages = optional cfg.install pkgs.emacs;

    home-manager.users.${user.name} = { config, pkgs, ... }: {
      home.sessionPath = [ "${config.xdg.configHome}/emacs/bin" ];

      home.sessionVariables = {
        DOOMDIR = "${config.xdg.configHome}/doom-config";
        DOOMLOCALDIR = "${config.xdg.configHome}/doom-local";
        EDITOR = "emacsclient -t -a emacs";
        VISUAL = "emacsclient -t -a emacs";
      };

      home.packages = with pkgs;
        [ (ripgrep.override { withPCRE2 = true; }) sqlite editorconfig-core-c ]
        ++ optional cfg.install-in-home emacs;

      xdg.configFile = {
        "doom-config/".source =
          config.lib.file.mkOutOfStoreSymlink "${pwd}/doom.d";

        # "emacs" = {
        #   source = inputs.doom-emacs;
        #   onChange = "${pkgs.writeShellScript "doom-change" ''
        #     export DOOMDIR="${config.home.sessionVariables.DOOMDIR}"
        #     export DOOMLOCALDIR="${config.home.sessionVariables.DOOMLOCALDIR}"
        #     if [ ! -d "$DOOMLOCALDIR" ]; then
        #       ~/.config/emacs/bin/doom -y install
        #         else
        #       ~/.config/emacs/bin/doom -y sync -u
        #     fi
        #   ''}";
        # };
      };
    };
  };
}
