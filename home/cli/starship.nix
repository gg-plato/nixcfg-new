{
  pkgs,
  ...
}:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = false; # Disable if you set up fish integration manually in fish.nix, Integration is enabled by default and is not supported in login shell
    enableBashIntegration = false; 

    # Configuration written to ~/.config/starship.toml
    # settings = {};
  };
}
