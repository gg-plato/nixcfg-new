{ pkgs, ... }:
{
  # nix-flatpak
  services.flatpak.remotes = [
    {
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }
    {
      name = "cosmic";
      location = "https://apt.pop-os.org/cosmic/cosmic.flatpakrepo";
    }
  ];
  services.flatpak.packages = [
    "app.zen_browser.zen"
    # "com.microsoft.Edge"
    "com.github.tchx84.Flatseal"
    "com.stremio.Stremio"
    "io.github.Foldex.AdwSteamGtk"
    "com.jeffser.Alpaca"
    # "com.collaboraoffice.Office"
    # "org.gnome.Firmware"
    # {
    #   appId = "io.github.cosmic_utils.minimon-applet";
    #   origin = "cosmic";
    # }
  ];
  services.flatpak.uninstallUnmanaged = true;
  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "daily"; # Default value
  };

  services.flatpak.update.onActivation = true;
}
