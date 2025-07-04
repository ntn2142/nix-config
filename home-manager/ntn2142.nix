{
  config,
  pkgs,
  ...
}:
{
  home.username = "ntn2142";
  home.homeDirectory = "/home/ntn2142";

  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    tree-sitter
    fzf
    nerd-fonts._0xproto
    clang
    clang-tools
    nil
    nixfmt-rfc-style
    lua-language-server
    stylua
    marksman
    nodePackages.prettier
    texliveFull
    # (texliveFull.withPackages (ps: [ ps.latexindent ])) # miktex
    texlab
    tex-fmt
    pyright
    ruff
    jdt-language-server
    google-java-format
    (catppuccin-kde.override {
      flavour = [
        "mocha"
        "latte"
      ];
      accents = [ "mauve" ];
      winDecStyles = [ "classic" ];
    })
    spotify
    dotter
  ];

  programs = {
    bash = {
      enable = true;
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
      enableInteractive = true;
      settings = {
        add_newline = false;
        palette = "catppuccin_mocha";
        palettes.catppuccin_mocha = {
          rosewater = "#f5e0dc";
          flamingo = "#f2cdcd";
          pink = "#f5c2e7";
          mauve = "#cba6f7";
          red = "#f38ba8";
          maroon = "#eba0ac";
          peach = "#fab387";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          teal = "#94e2d5";
          sky = "#89dceb";
          sapphire = "#74c7ec";
          blue = "#89b4fa";
          lavender = "#b4befe";
          text = "#cdd6f4";
          subtext1 = "#bac2de";
          subtext0 = "#a6adc8";
          overlay2 = "#9399b2";
          overlay1 = "#7f849c";
          overlay0 = "#6c7086";
          surface2 = "#585b70";
          surface1 = "#45475a";
          surface0 = "#313244";
          base = "#1e1e2e";
          mantle = "#181825";
          crust = "#11111b";
        };
      };
    };
    git = {
      enable = true;
      userName = "ntn2142";
      userEmail = "ntn2142@proton.me";
    };
    lazygit = {
      enable = true;
      settings = {
        gui.theme = {
          activeBorderColor = [
            "#cba6f7"
            "bold"
          ];
          inactiveBorderColor = [ "#94e2d5" ];
          optionsTextColor = [ "#89b4fa" ];
          selectedLineBgColor = [ "#313244" ];
          cherryPickedCommitBgColor = [ "#45475a" ];
          cherryPickedCommitFgColor = [ "#fab387" ];
          unstagedChangesColor = [ "#f38ba8" ];
          defaultFgColor = [ "#cdd6f4" ];
          searchingActiveBorderColor = [ "#f9e2af" ];
        };
        gui.nerdFontsVersion = "3";

      };
    };
    alacritty = {
      enable = true;
      theme = "catppuccin_mocha";
      settings = {
        window = {
          title = "Alacritty";
          dynamic_title = true;
        };
        font = {
          size = 14.0;
          normal = {
            family = "0xProto Nerd Font Mono";
            style = "Regular";
          };
          bold = {
            family = "0xProto Nerd Font Mono";
            style = "Bold";
          };
          italic = {
            family = "0xProto Nerd Font Mono";
            style = "Italic";
          };
          bold_italic = {
            family = "0xProto Nerd Font Mono";
            style = "Bold Italic";
          };
        };
      };
    };
    firefox = {
      enable = true;
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };

}
