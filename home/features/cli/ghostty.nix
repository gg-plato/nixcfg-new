{
  pkgs,
  ...
}:
{
  programs.ghostty = {
    enable = true;

    enableFishIntegration = true;
    enableBashIntegration = true;

    # Configuration written to ~/.config/ghostty/config.txt
    settings = {
      theme = "Catppuccin Macchiato";
      background-opacity = 0.5; # use 0.8 on cosmic and 0.5 on Plasma6
      background-blur = true;
      window-decoration = "none"; # use "none" on cosmic and "auto" on Plasma6
      # command = "fish --login --interactive"; # not needed if fish is the default shell
    };
  };
}