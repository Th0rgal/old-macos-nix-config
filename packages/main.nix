{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # MISC
    tmate

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
    python310
  ];

}
