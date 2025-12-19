{ pkgs, ... }:

{

  # Enable zram
  zramSwap.enable = true;

  # Bootloader
  boot = {

    loader = {

      limine = {
        enable = true;
        # secureBoot.enable = false;
        maxGenerations = 3;
        style = {
          wallpapers = [
            "${pkgs.cosmic-wallpapers}/share/backgrounds/cosmic/phytoplankton_bloom_nasa_oli2_20240121.jpg"
          ];
          graphicalTerminal.margin = 0;
          graphicalTerminal.background = "80000000";
        };
      };
      # systemd-boot = {
      #   enable = false;
      #   configurationLimit = 3;
      # };
      efi.canTouchEfiVariables = true;
    };

    # Use latest kernel
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "bcachefs" ];

    plymouth = {
      enable = true;
      theme = "hud_3";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [
            "glowing"
            "hud_3"
            "abstract_ring_alt"
          ];
        })
      ];
    };

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
  };

}
