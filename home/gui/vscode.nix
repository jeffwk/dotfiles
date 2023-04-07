{ config, lib, pkgs, ... }: {
  home.sessionVariables = { NIXOS_OZONE_WL = "1"; };
  programs.vscode = lib.optionalAttrs (!pkgs.stdenv.isDarwin) {
    enable = true;
    package = pkgs.vscode.fhsWithPackages
      (ps: with ps; [ rustup zlib openssl.dev pkg-config ]);
  };
}
