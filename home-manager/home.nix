{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "fugue";
  home.homeDirectory = "/home/fugue";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # It is sometimes useful to fine-tune packages, for example, by applying
    # overrides. You can do that directly here, just don't forget the
    # parentheses. Maybe you want to install Nerd Fonts with a limited number
    # of fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # You can also create simple shell scripts directly inside your
    # configuration. For example, this adds a command 'my-hello' to your
    # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    asciinema
    # aseprite
    bat
    # bitwig-studio
    btop
    blender
    blockbench
    # bottles # flatpak
    # bluebubbles
    bibletime
    bulletty
    # package to watch/package?
    # https://codeberg.org/janantos/brow6el
    # cinny-desktop
    calcurse
    cmatrix
    # codeberg-cli # archived
    # concord
    cpufetch
    # dia
    ddgr
    dialog
    discordo
    dmenu-wayland
    dragon-drop
    dunst
    # enola
    espanso
    f3
    fastfetch
    ffmpeg
    # fjo # archived
    forgejo-cli
    # fluffychat
    freecad
    gh
    godot
    goldendict-ng
    graphite
    groff
    havn
    help2man
    heroic
    hyfetch
    # iamb # crazy compilation time
    inetutils
    inkscape
    inputs.yt-x.packages."${system}".default
    isort
    kdePackages.kdenlive
    kjv
    lazygit
    legcord
    lexy
    lilypond
    # lilgptracker
    localsend
    lue
    # lutris - requires steam
    man
    man-pages
    mandown
    # manga-cli
    manga-tui
    manix
    # mdbook-man
    # milkytracker
    mpv
    neomutt
    nethack
    nsxiv
    obs-cli
    openscad
    openvpn
    (pass.withExtensions (e: [
      e.pass-otp
    ]))
    penpot-desktop
    photoflare
    pixieditor
    portal
    pqiv
    proton-vpn
    # proton-vpn-cli
    pureref
    qiv
    # qmlls
    kdePackages.qtdeclarative
    qrencode
    # reaper
    reddix
    ripgrep
    # schismtracker
    scli
    sherlock
    showmethekey
    sioyek
    slides
    solvespace
    # soundtracker
    sox
    streamlink
    streamlink-twitch-gui-bin
    # sway
    # swaybg
    stremio-linux-shell # outdated qt-engine dependency
    tagainijisho
    tealdeer
    teensy-loader-cli
    tcpdump
    # tic-80 - requires insecure
    # whole buncha tmux plugins
    tintin
    toilet
    tor
    tran
    trash-cli
    tuir
    #typing - choose one
    thokr
    ttyper
    typeinc
    typioca
    typtea
    # verse # gonna package this
    # upower
    vesktop
    vimiv-qt
    warpd
    waybar
    webcamize
    # weechat
    (weechat.override {
      configure =
        { availablePlugins, ... }:
        {
          plugins = with availablePlugins; [
            python
            perl
          ];
          # scripts = with pkgs.weechatScripts; [
          #   # edit
          #   # weechat-autosort
          #   # weechat-go
          #   # weechat-matrix
          #   # weechat-matrix-bridge
          # ];
        };
    })
    # weechat-matrix-rs # heavy compile
    wf-recorder
    # wikiman
    # winboat
    wiki-tui
    wine-wayland
    winetricks
    wiremix
    xdg-ninja
    xdg-user-dirs
    # xdg-desktop-portal-termfilechooser
    yewtube
    youtube-tui
    ytfzf
    yt-dlp
    ytdl-sub
    zbar
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "bitwig-studio-unwrapped"
      "aseprite"
      "graphite"
      "lutris"
      "objectbox-linux"
      "pureref"
      "reaper"
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
      "steamcmd"
      "steam-tui"
      "stremio-linux-shell"
    ];

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;

  # home.sesstion

  home.preferXdgDirectories = true;

  # xdg.configFile."xdg-desktop-portal-termfilechooser/config" = {
  #   force = true;
  #   # enable = true;
  #   # how can I make this look nicer with an 80 char wrap?
  #   text = ''
  #     [filechooser]
  #     cmd=$HOME/.config/xdg-desktop-portal-termfilechooser/vifm-wrapper.sh
  #     env=TERMCMD=foot
  #     env=PATH="$PATH:/run/current-system/sw/bin"
  #   '';
  # };

  # xdg.configFile."xdg-desktop-portal-termfilechooser/config" = {
  #   force = true;
  #   # enable = true;
  #   # how can I make this look nicer with an 80 char wrap?
  #   text = ''
  #     [filechooser]
  #     cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/vifm-wrapper.sh
  #     default_dir=$HOME/descargas/
  #     env=TERMCMD=foot
  #     open_mode=last
  #     save_mode=suggested
  #   '';
  # };

  # modules
  imports = [
    ./browsers
    ./fuzzel.nix
    ./git.nix
    ./gtk.nix
    ./neovim.nix
    ./obs.nix
    ./ssh.nix
    ./styling.nix
    ./xdg
    ./weechat.nix
    # ./znc.nix
  ];

  programs.man.generateCaches = true;
  services.playerctld.enable = true;
  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
  };
  # services.poweralertd.enable = true;

  programs.lutris.enable = true;

  programs.wallust = {
    enable = true;
  };

  # programs.wshowkeys = {
  #   enable = true;
  # };

  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true;
  #   dedicatedServer.openFirewall = true;
  #   # localNetworkgameTransfers.openFirewall = true;
  # };

  home.pointerCursor = {
    # name = "Vanilla-DMZ";
    # package = pkgs.vanilla-dmz;
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    enable = true;
    size = 8;
    gtk = {
      enable = true;
    };
  };

}
