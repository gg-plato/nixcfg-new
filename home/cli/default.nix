{ pkgs, ... }:
{
  imports = [
    ./fish.nix
    ./starship.nix
    ./ghostty.nix
    ./helix.nix
  ];

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
  programs.zoxide.enable = true;
  programs.eza = {
    enable = true;
    extraOptions = [
      "-l"
      "--icons"
      "--git"
      "-a"
    ];
  };

  programs.bat.enable = true;
  programs.btop.enable = true;

  home.packages = with pkgs; [
    fd
    ripgrep
    tealdeer
    zip
    yazi
    fastfetch
    rustup
    typst
    tinymist
    nil # nix lsp
    nixfmt # nix formatter
    uv
    # pixi
    # ruff
    # julia
    harper
    gemini-cli
    ollama
  ];

}
