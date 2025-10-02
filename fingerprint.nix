{ config, pkgs, ... }:

{
  # Start the driver at boot
  systemd.services.fprintd = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "simple";
  };

  # Install the driver
  services.fprintd = {
    enable = true;
    # If simply enabling fprintd is not enough, try enabling fprintd.tod...
    #tod.enable = true;
    # ...and use one of the next four drivers
    tod.driver = pkgs.libfprint-2-tod1-goodix; # Goodix driver module
    #tod.driver = pkgs.libfprint-2-tod1-goodix-550a; # Goodix 550a driver (from Lenovo)
  };
}
