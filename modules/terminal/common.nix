{ config, lib, pkgs, ... }:
with lib;
with lib.my;
let
  inherit (config) user host;
  inherit (host) darwin;
  cfg = config.modules.terminal;
in {
  options.modules.terminal = { enable = mkBoolOpt true; };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cachix
    ];
    home-manager.users.${user.name} = { config, pkgs, ... }: {
      xdg.configFile = {
        "htop/htoprc".source = config.lib.file.mkOutOfStoreSymlink
          "${config.host.config-dir}/dotfiles/htop/htoprc";
      };

      home.file = { ".tmux.conf".source = ../../dotfiles/tmux.conf; };

      programs.htop = {
        enable = true;
        package = optimize config pkgs.htop;
      };

      programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
      };

      xdg.configFile."nvim/".source =
        config.lib.file.mkOutOfStoreSymlink "${host.config-dir}/dotfiles/nvim";

      home.packages = with pkgs; [
        (optimize config fd)
        (optimize config lsd)
        (optimize config pls)
        autossh
        curl
        entr
        expect
        glow
        inetutils
        inxi
        jc
        jq
        mods
        ncdu
        neofetch
        pass
        p7zip
        procs
        pueue
        ripgrep
        screenfetch
        tmux
        tree
        unrar
        unzip
        w3m
        wget
        zip
        xz
      ];
    };
  };
}
