{ config, pkgs, lib, ... }:

{
  imports = [ ./vscode.nix ];

  programs = {
    git = {
      enable = true;
      userName = "Thomas Marchand";
      userEmail = "thomas.marchand" + "@" + "tuta.io";

      signing = {
        key = "4BC51E62F387016F";
        signByDefault = true;
      };

      extraConfig = { init.defaultBranch = "master"; };
    };

    zsh = {
      enable = true;
      initExtraFirst = ''
        # to not execute this file when running in a pure nix-shell.
        # if test -n "$IN_NIX_SHELL"; then return; fi

        [ ! -d "$HOME/.zsh/fsh/" ] && mkdir $HOME/.zsh/fsh/
        export FAST_WORK_DIR=$HOME/.zsh/fsh/;
        export PATH=$PATH:~/.npm-global/bin;
        '';
      plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.6.4";
            sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
          };
        }
        {
          name = "fast-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zdharma-continuum";
            repo = "fast-syntax-highlighting";
            rev = "v1.55";
            sha256 = "0h7f27gz586xxw7cc0wyiv3bx0x3qih2wwh05ad85bh2h834ar8d";
          };
        }
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = lib.cleanSource ./p10k-config;
          file = "p10k.zsh";
        }
      ];
    };
  };

}
