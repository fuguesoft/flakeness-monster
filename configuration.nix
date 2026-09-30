{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.kernelModules = [
    "v4l2loopback"
    "snd-aloop"
  ];

  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Privacy = "device";
          JustWorksRepairing = "always";
          Class = "0x000100";
          FastConnectable = "true";
        };
      };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    xpadneo = {
      enable = true;
    };
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "es_ES.UTF-8";
    inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
      ];
    };
  };

  # tty settings
  console = {
    keyMap = "es";
    font = "Victor-Mono";
  };

  networking = {
    firewall = {
      allowedTCPPorts = [
        6697
        6667
      ];
      checkReversePath = false;
    };
    hostName = "indigo"; # Define your hostname.

    # Configure network connections interactively with nmcli or nmtui.
    networkmanager.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    fugue = {
      shell = pkgs.fish;
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
        tree
        keyd
      ];
    };
  };

  programs.droidcam.enable = true;

  programs.fish.enable = true;
  services.flatpak.enable = true;
  programs.foot.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
    # allowPresetPassphrase = true;
    # settings = {
    #   allow-preset-passphrase = true;
    # };
  };

  # programs.ssh.startAgent = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    # localNetworkgameTransfers.openFirewall = true;
  };

  programs.wshowkeys.enable = true;
  programs.ydotool.enable = true;

  services.espanso = {
    enable = true;
    package = pkgs.espanso-wayland;
  };

  services.fprintd = {
    enable = true;
  };

  services.passSecretService.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  security.pam.services.fugue.gnupg = {
    enable = true;
    # storeOnly = true;
    # noAutostart = true;
  };

  security.polkit.enable = true;
  services.upower = {
    enable = true;
    usePercentageForPolicy = true;
    percentageLow = 20;
    percentageCritical = 5;
    criticalPowerAction = "HybridSleep";
  };

  services.udisks2.enable = true;

  virtualisation = {
    # waydroid = {
    #   enable = true;
    #   package = pkgs.waydroid-nftables;
    # };
    libvirtd = {
      enable = true;
    };
  };

  programs.virt-manager.enable = true;
  programs.obs-studio.enableVirtualCamera = true;

  documentation = {
    man = {
      enable = true;
      man-db.enable = true;
    };
    # man.cache.enable = true;
    dev.enable = true;
  };

  services.usbmuxd.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.victor-mono
    nerd-fonts.symbols-only
    mplus-outline-fonts.githubRelease
  ];

  # temporary lix
  # nix.package = pkgs.lixPackageSets.stable.lix;

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "aseprite"
      "bitwig-studio-unwrapped"
      "lutris"
      "pureref"
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
      "steamcmd"
      "steam-tui"
    ];

  nix.settings = {
    substituters = [
      # "https://graphite.cachix.org"
      "https://nix-community.cachix.org"

      # Affinity on Linux
      # "https://cache.garnix.io"
    ];
    trusted-public-keys = [
      # "graphite.cachix.org-1:B7Il1yMpkquN/dXM+5GRmz+4Xmu2aaCS1GcWNfFhsOo="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="

      # Affinity on Linux
      # "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];

    experimental-features = [
      "nix-command"
      "flakes"
    ];
    allowed-users = [
      "@wheel"
      "fugue"
    ];
    trusted-users = [
      "root"
      "fugue"
      "@wheel"
    ];
  };

  # FLAKE USAGE for ???
  # nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  # add `inputs` to attrset args at top of file

  system.stateVersion = "25.11"; # Did you read the comment?

}
