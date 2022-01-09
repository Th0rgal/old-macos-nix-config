{ config, pkgs, ... }:

{
  imports = [ ./configs/main.nix ./packages/main.nix ];
  nixpkgs.overlays = [ (import ./overlays/main.nix) ];

  programs.home-manager.enable = true;

  home.username = "thomas";
  home.homeDirectory = "/Users/thomas";
  home.stateVersion = "21.11";
}
