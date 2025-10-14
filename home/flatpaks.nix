{ pkgs, ... }:
{  # nix-flatpak
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
    "com.github.tchx84.Flatseal"
    "com.stremio.Stremio"
    "io.github.Foldex.AdwSteamGtk"
    "io.github.giantpinkrobots.flatsweep"
    "org.gnome.Firmware"
    {
      appId = "io.github.cosmic_utils.minimon-applet";
      origin = "cosmic";
    }
  ];
  services.flatpak.uninstallUnmanaged = true;
  services.flatpak.update.onActivation = true;
  }