{ pkgs, ... }:

{
  imports = [ ./alacritty.nix ];

  home.packages = with pkgs; [
    # MISC
    tmate
    pkg-config

    # TERMINAL
    htop
    neofetch
    tree
    gnupg
    aria2
    imagemagick

    # DEVELOPMENT
    nixfmt
    nodejs
    poetry
  ];

}
