{ config, pkgs, ... }:

{

  # Unlock keyring with fingerprint
  security.pam.services.greetd.enableGnomeKeyring = true; # Needed to unlock keyring when logging in with fingerprint, currently not working
  security.pam.services.login.fprintAuth = false; # TODO: Disable fingerprint auth for login due to bugs, currently not working

  # Install the driver
  services.fprintd = {
    enable = true;
    # If simply enabling fprintd is not enough, try enabling fprintd.tod...
    # tod.enable = true;
    # ...and use one of the next four drivers
    tod.driver = pkgs.libfprint-2-tod1-goodix; # Goodix driver module
    #tod.driver = pkgs.libfprint-2-tod1-goodix-550a; # Goodix 550a driver (from Lenovo)
  };
}
