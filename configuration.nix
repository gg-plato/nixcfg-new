# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./boot.nix
    # ./fingerprint.nix
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # PC Name
  networking.hostName = "codex"; # Define your hostname.
  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

  users.users.greg = {
    initialHashedPassword = "$y$j9T$YVceDkpYIskOz1qqDvLfe/$P.pefstoDTYnec8CHL9rZPsMGhiXBBNmFvdFmOZBkL/";
    isNormalUser = true;
    description = "Grigore Platon";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  environment = {
    sessionVariables = {
      EDITOR = "hx";
    };
  };
  # Set your timezone.
  time.timeZone = "Europe/Lisbon";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };

  # Linux Firmware Update Daemon
  services.fwupd.enable = true;

  # USB devices auto-mount
  services.udisks2.enable = true;

  # Use Sudo-rs and disable sudo
  security = {
    sudo.enable = false;
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = true;
    };
  };

  programs.fish.enable = true;
  # Set Default Shell
  users.defaultUserShell = pkgs.fish;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  # Enable XWayland support in COSMIC
  services.desktopManager.cosmic.xwayland.enable = true;

  # Enable gnome-keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.cosmic-greeter.enableGnomeKeyring = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pt";
    variant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "pt-latin1";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound with pipewire.
  # hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Disable Auto-Mute for key LED bug
  hardware.alsa.enablePersistence = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Install firefox.
  # programs.firefox.enable = true;

  # programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = with pkgs; [
  #   # Add any missing dynamic libraries for unpackaged programs
  #   # here, NOT in environment.systemPackages
  # ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nil # nix lsp
    nixfmt-rfc-style # nix formatter
    zotero
    file-roller
    cosmic-ext-tweaks
    foliate
    papers
    feh
    discord
    spotify
    signal-desktop
    starsector
  ];

  fonts.packages = with pkgs; [
    monaspace
    corefonts
  ];

  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # services.power-profiles-daemon.enable = false;
  # services.tlp = {
  #   enable = true;
  #   settings = {
  #     #Optional helps save long term battery health
  #     START_CHARGE_THRESH_BAT0 = 50; # 50 and below it starts to charge
  #     STOP_CHARGE_THRESH_BAT0 = 70; # 70 and above it stops charging
  #   };
  # };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # programs.ssh.startAgent = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
