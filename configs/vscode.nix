{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    extensions = (with pkgs.vscode-extensions; [ brettm12345.nixfmt-vscode ]);

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
        bracketPairColorization.enabled = true;
      };

      workbench = {
        iconTheme = "material-icon-theme";
        colorTheme = "GitHub Dark"; # Material Theme Ocean High Contrast
        preferredDarkColorTheme = "GitHub Dark";
        preferredLightColorTheme = "GitHub Light";
      };

      ocamlformat-vscode-extension = {
        customOcamlformatPath = "ocamlformat";
        ocamlformatOption =
          "--enable-outside-detected-project,--break-cases=fit-or-vertical,--cases-exp-indent=4,--if-then-else=k-r,--type-decl-indent=4";
      };

      #jupyter.widgetScriptSources = [ "jsdelivr.com" "unpkg.com" ]; # required by qgrid
      jupyter.alwaysTrustNotebooks = true;
      rust-client.rustupPath = "${pkgs.rustup}/bin/rustup";
      latex-workshop.view.pdf.viewer = "tab";
      cmake.configureOnOpen = false;
      python.formatting.provider = "black";
      #"[ocaml]" = {
      #  editor.defaultFormatter = "hoddy3190.ocamlformat-vscode-extension";
      #};
      "[css]" = { editor.defaultFormatter = "MikeBovenlander.formate"; };

      files.exclude = {
        "**/.git" = true;
        "**/.svn" = true;
        "**/.hg" = true;
        "**/CVS" = true;
        "**/.DS_Store" = true;
        "**/Thumbs.db" = true;
        "**/*.olean" = true;
      };
    };
  };
}
