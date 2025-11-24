{ config, pkgs, ... }:

{

  # Enable zram
  zramSwap.enable = true;

  # Bootloader
  boot = {

    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 3;
      };
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
