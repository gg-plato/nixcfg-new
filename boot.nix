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
      theme = "glowing";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "glowing" ];
        })
      ];
    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;


    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };

}
