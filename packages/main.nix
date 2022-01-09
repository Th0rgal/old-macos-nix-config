{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # MISC
    tmate

    # TERMINAL
    any-nix-shell
    htop
    neofetch
    tree
    gnupg
    aria2
    imagemagick

    # DEVELOPMENT
    nixfmt
    rustup
    nodejs

    # SYSADMIN
    #(callPackage ./termius.nix { })

    # BLOCKCHAIN

  ];

}
