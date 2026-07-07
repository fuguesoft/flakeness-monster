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
      powerOnBoot = false;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
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

  # new section
  # don't forget to delete `rec` at the top
  environment.sessionVariables = rec {
    EDITOR = "nvim";
    VISUAL = "nvim";

    LESS = "-R";
    MANPAGER = "less +Gg -M -R -I --use-color -Dd+r -Du+b";

    XDG_CACHE_HOME = "$HOME/.cache";
    GNUPGHOME = "${XDG_DATA_HOME}\/gnupg";

    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_BIN_HOME = "$HOME/.local/bin";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_DESKTOP_DIR = "$HOME/escritorio";
    XDG_DOCUMENTS_DIR = "$HOME/documentos";
    XDG_DOWNLOAD_DIR = "$HOME/descargas";
    XDG_MUSIC_DIR = "$HOME/música";
    XDG_PICTURES_DIR = "$HOME/imágenes";
    XDG_PUBLICSHARE_DIR = "$HOME/público";
    XDG_STATE_HOME = "$HOME\/.local/state";
    XDG_TEMPLATES_DIR = "$HOME/plantillas";
    XDG_VIDEOS_DIR = "$HOME/vídeos";

    # What's the syntax here for defining this?
    # Use `rec`
    HISTFILE = "${XDG_STATE_HOME}\/bash/history";
    NIRIDOC = "${pkgs.niri.doc}/share/doc/niri/wiki";
    # getDoc is darwin only
    # NIRIDOC = "${pkgs.lib.getDoc pkgs.niri}/share/doc/niri/wiki";
    PASSWORD_STORE_DIR = "${XDG_DATA_HOME}\/pass";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
    # qml-niri (absolute nonsense, don't do this)
    # system = pkgs.stdenv.hostPlatform.system;
    # QT_PLUGIN_PATH = [
    #   inputs.qml-niri.packages.${system}.default
    # ];
    PARALLEL_HOME = "${XDG_CONFIG_HOME}/parallel";
    PYTHON_HISTORY = "${XDG_STATE_HOME}\/python_history";
    SUDO_ASKPASS = "${XDG_BIN_HOME}\/_askpass.sh";
    W3M_DIR = "${XDG_DATA_HOME}\/w3m";
    WINEPREFIX = "${XDG_DATA_HOME}/wine";
    XCOMPOSECACHE = "${XDG_CACHE_HOME}\/X11/xcompose";
  };

  programs.droidcam.enable = true;

  programs.fish.enable = true;
  services.flatpak.enable = true;
  programs.foot.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
    # settings = {
    #   allow-preset-passphrase = true;
    # };
  };

  programs.mangowc = {
    enable = true;
  };

  programs.niri = {
    enable = true;
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

  # resolve conflict between keyd and libinput that interferes with dwt
  environment.etc."libinput/local-overrides.quirks".text = pkgs.lib.mkForce ''
    [Serial Keyboards]
    MatchUdevType=keyboard
    MatchName=keyd virtual keyboard
    AttrKeyboardIntegration=internal
  '';

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "overload(control, esc)";
          };
        };
      };
    };
  };

  services.passSecretService.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # services.uxplay.enable = true;

  # services.weechat = {
  #   enabled = true;
  # };

  security.pam.services.fugue.gnupg = {
    enable = true;
    storeOnly = true;
    noAutostart = true;
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
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    # alacritty
    brightnessctl
    btop
    chafa
    # inputs.concord.packages.${system}.default
    elinks
    fd
    foot
    fprintd
    git
    gnumake
    gphoto2
    greetd
    hello
    home-manager
    ifuse
    inxi
    irssi
    pciutils
    killall
    kjv
    # lukesmithxyz-bible-kjv
    libimobiledevice
    linuxPackages.v4l2loopback
    lynx
    man-pages
    man-pages-posix
    mangowc
    ncdu
    neovim
    nil
    niri
    nmap
    # nixd # old nix formatter
    nudoku
    # install pass w/ pass-otp
    (pass.withExtensions (e: [
      e.pass-otp
    ]))
    pinentry-curses
    playerctl
    podman
    inputs.qml-niri.packages.${system}.quickshell
    quickshell
    # inputs.qml-niri.packages.${system}.default
    # inputs.qml-niri.packages.${system}.quickshell
    ripgrep
    socat
    timg
    tmux
    tree
    tuigreet
    unzip
    unrar-free
    usbmuxd
    usbutils
    uxplay
    v4l-utils
    vifm
    vim
    w3m
    wayland
    wayland-protocols
    wev
    wget
    wikiman # -- external sources broken
    wl-clipboard
    # xdg-desktop-portal-termfilechooser
    # xurls
    xwayland-satellite
    # KDE Utilities
    # kdePackages.discover # Optional: Software center for Flatpaks/firmware updates
    # kdePackages.kcalc # Calculator
    # kdePackages.kcharselect # Character map
    # kdePackages.kclock # Clock app
    # kdePackages.kcolorchooser # Color picker
    # kdePackages.kolourpaint # Simple paint program
    # kdePackages.ksystemlog # System log viewer
    # kdePackages.sddm-kcm # SDDM configuration module
    # kdiff3 # File/directory comparison tool
  ];

  documentation = {
    man = {
      enable = true;
      man-db.enable = true;
    };
    # man.cache.enable = true;
    dev.enable = true;
  };

  services.usbmuxd.enable = true;

  # fileSystems."/run/media/fugue/OP-1" = {
  #   device = "/james";
  #   fsType = "ext4";
  #   enable = true;
  #   options = [
  #     "users"
  #     "nofail"
  #     "exec"
  #   ];
  # };

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
      "https://cache.garnix.io"
    ];
    trusted-public-keys = [
      # "graphite.cachix.org-1:B7Il1yMpkquN/dXM+5GRmz+4Xmu2aaCS1GcWNfFhsOo="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="

      # Affinity on Linux
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
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

  # List services that you want to enable:

  system.stateVersion = "25.11"; # Did you read the comment?

}
