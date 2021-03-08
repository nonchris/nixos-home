{ config, pkgs, ... }:

let
  mayniklas = builtins.fetchGit {
    # Updated 2020-03-07
    url = "https://github.com/mayniklas/nixos-home";
    rev = "cb1517d09b0995d4c7bad8424e7baa56b68c31c4";
  };
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "chris";
  home.homeDirectory = "/home/chris";

  # Imports
  imports = [
    "${mayniklas}/modules/alacritty.nix"
    "${mayniklas}/modules/chromium.nix"
    "${mayniklas}/modules/devolopment.nix"
    
    ./modules/firefox.nix
  ];

  home.packages = with pkgs; [
    _1password-gui
    atom
    discord
    htop
    hugo
    mpv
    nvtop
    obs-studio
    signal-desktop
    spotify
    sublime-merge
    sublime3
    thunderbird
    unzip
    vim
    vlc
    youtube-dl
  ];

  programs = {
    git = {
      enable = true;
      userEmail = "git@chris-ge.de";
      userName = "nonchris";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
