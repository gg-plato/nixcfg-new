{
  pkgs,
  ...
}:
{
  programs.ghostty = {
    enable = true;

    # enableFishIntegration = true;
    enableBashIntegration = true;

    # Configuration written to ~/.config/ghostty/config.txt
    settings = {
      theme = "Catppuccin Macchiato";
      font-family = "Monaspace Neon NF";
      font-feature =  "'calt', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09', 'ss10', 'liga'";
      background-opacity = 0.5; # use 0.8 on cosmic and 0.5 on Plasma6
      background-blur = true;
      window-decoration = "none"; # use "none" on cosmic and "auto" on Plasma6
      command = "nu";
      # command = "fish --login --interactive"; # not needed if fish is the default shell
    };
  };
}