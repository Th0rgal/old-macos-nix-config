{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    extensions = (with pkgs.vscode-extensions; [ brettm12345.nixfmt-vscode ])
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [

        # Languages support
        {
          name = "solidity";
          publisher = "juanblanco";
          version = "0.0.137";
          sha256 = "sha256-TyqCFFsHznDEM0BnLD6Ni54SrSFpNEESWxAWE6kv29M=";
        }
        {
          name = "cmake-tools";
          publisher = "ms-vscode";
          version = "1.5.3";
          sha256 = "1y2s8rsc94ywbr23x9lhz0idp0d2lbv2vck636blvxsgxmcmmx8d";
        }
        {
          name = "rust";
          publisher = "rust-lang";
          version = "0.7.8";
          sha256 = "039ns854v1k4jb9xqknrjkj8lf62nfcpfn0716ancmjc4f0xlzb3";
        }
        {
          name = "language-cython";
          publisher = "guyskk";
          version = "0.0.6";
          sha256 = "02v0sp5finy8b07ny5fh8x7j8m3j2in5ffhcjvxkmwgf9cqas483";
        }
        {
          name = "formate";
          publisher = "mikebovenlander";
          version = "1.1.6";
          sha256 = "0vzp9x5p9fmgrvrhmm4a6x9b3fgrmy22zwy972wx1p3k748g8ylc";
        }
        {
          name = "ocamlformat-vscode-extension";
          publisher = "hoddy3190";
          version = "0.0.2";
          sha256 = "0gqjiccw9i0xfz2lj8vwxbr8zy1s69fyckyhpvlhnxfn5dacrsd4";
        }
        {
          name = "reasonml";
          publisher = "freebroccolo";
          version = "1.0.38";
          sha256 = "1nay6qs9vcxd85ra4bv93gg3aqg3r2wmcnqmcsy9n8pg1ds1vngd";
        }
        {
          name = "Nix";
          publisher = "bbenoist";
          version = "1.0.1";
          sha256 = "1nay6qs9vcxd85ra4bv93gg3aqg3r2wmcnqmcsy9n8pg1ds1vngd";
        }

        # config support
        {
          name = "latex-workshop";
          publisher = "James-Yu";
          version = "8.15.0";
          sha256 = "0v4pq3l6g4dr1qvnmgsw148061lngwmk3zm12q0kggx85blki12d";
        }
        {
          name = "better-toml";
          publisher = "bungcip";
          version = "0.3.2";
          sha256 = "08lhzhrn6p0xwi0hcyp6lj9bvpfj87vr99klzsiy8ji7621dzql3";
        }
        {
          name = "markdown-preview-enhanced";
          publisher = "shd101wyy";
          version = "0.6.2";
          sha256 = "sha256-tjRXAoUS63d2hsiL2a528+hQeal8pKP1eTnkf/qiUQo=";
        }

        # Theme
        {
          name = "material-icon-theme";
          publisher = "PKief";
          version = "4.14.1";
          sha256 = "sha256-OHXi0EfeyKMeFiMU5yg0aDoWds4ED0lb+l6T12XZ3LQ=";
        }
        {
          name = "github-vscode-theme";
          publisher = "github";
          version = "6.0.0";
          sha256 = "1a77mbx75xfsfdlhgzghj9i7ik080bppc3jm8c00xp6781987fpa";
        }

        # Misc
        {
          name = "nix-env-selector";
          publisher = "arrterian";
          version = "0.1.2";
          sha256 = "1n5ilw1k29km9b0yzfd32m8gvwa2xhh6156d4dys6l8sbfpp2cv9";
        }
        {
          name = "copilot";
          publisher = "GitHub";
          version = "1.6.3571";
          sha256 = "00sw75my466mzsrqjafzxbzv397vmlfafllbljvql6crxpl45v57";
        }
      ];

    userSettings = {
      update.mode = "none";
      window = {
        zoomLevel = 0;
        autoDetectColorScheme = true;
        menuBarVisibility = "toggle";
      };
      terminal.integrated.shell = {
        linux = "${pkgs.zsh}/bin/zsh";
        osx = "${pkgs.zsh}/bin/zsh";
      };

      editor = {
        fontFamily =
          "'JetBrainsMono Nerd Font Mono', 'monospace', monospace, 'Droid Sans Fallback'";
        fontSize = 13.5;
        fontLigatures = true;
        inlineSuggest.enabled = true;
      };

      workbench = {
        iconTheme = "material-icon-theme";
        colorTheme = "GitHub Dark"; # Material Theme Ocean High Contrast
        preferredDarkColorTheme = "GitHub Dark";
        preferredLightColorTheme = "GitHub Light";
      };

      ocamlformat-vscode-extension = {
        customOcamlformatPath = "ocamlformat";
        ocamlformatOption = "--enable-outside-detected-project";
      };

      #jupyter.widgetScriptSources = [ "jsdelivr.com" "unpkg.com" ]; # required by qgrid
      jupyter.alwaysTrustNotebooks = true;
      rust-client.rustupPath = "${pkgs.rustup}/bin/rustup";
      latex-workshop.view.pdf.viewer = "tab";
      cmake.configureOnOpen = false;
      python.formatting.provider = "black";
    };
  };
}
