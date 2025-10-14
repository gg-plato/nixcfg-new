{ pkgs, ... }:
{
  imports = [
    # ./fish.nix
    ./nushell.nix
    ./starship.nix
    ./ghostty.nix
    ./helix.nix
  ];

  programs.zoxide.enable = true;
  programs.eza = {
    enable = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
    # enableZshIntegration = true;
    # enableFishIntegration = true;
    extraOptions = [
      "-l"
      "--icons"
      "--git"
      "-a"
    ];
  };

  programs.bat.enable = true;

  home.packages = with pkgs; [
    # helix
    btop
    fd
    ripgrep
    tealdeer
    zip
    yazi
    gcr # Provides org.gnome.keyring.SystemPrompter
    fastfetch
    rustup
    typst
    tinymist
    nil # nix lsp
    nixfmt-rfc-style # nix formatter
    uv
    # pixi
    # ruff
    # pyright
    # pylyzer
    # marksman
    # harper
    # julia
  ];

}
