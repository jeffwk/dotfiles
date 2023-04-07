{ config, lib, pkgs, ... }:
let
  amdgpu-fan = with import <nixpkgs> { };
    pkgs.python3Packages.callPackage ../amdgpu-fan.nix { };
  python3-packages = (python-packages:
    with python-packages; [
      # pyatv
      # swaytools
      ### local packages
      aioharmony
      amdgpu-fan
      black
      editorconfig
      isort
      jsbeautifier
      mpv
      nose
      openai
      openaiauth
      openai-whisper
      pandas
      pip
      pulsectl
      pyflakes
      pytest
      python-mpv-jsonipc
      requests
      setuptools
      todoist
      vapoursynth
    ]);
  python3-custom = pkgs.python3.withPackages python3-packages;
in {
  environment.systemPackages = with pkgs; [ pipenv python2 python3-custom ];
}
