{
  config,
  pkgs,
  ...
}:
{

  home.username = "ntn2142";
  home.homeDirectory = "/home/ntn2142";

  home.stateVersion = "25.05";

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
      accents = [ "blue" ];
      winDecStyles = [ "classic" ];
    })
    dotter
  ];

  programs = {
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
            "#fab387"
            "bold"
          ];
          inactiveBorderColor = [ "#89b4fa" ];
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
    firefox.enable = true;

  };

}
