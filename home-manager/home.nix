{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

let
  fugue-kabmat = (import inputs.kabmat { inherit pkgs; }).kabmat;
in
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

  # fugue-kabmat = (import /home/fugue/documentos/dev/nix/flow-kanban/kabmat.nix);
  home.packages = with pkgs; [
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
    # fugue-kabmat

    # A
    asciinema
    asak
    aseprite
    atac

    # B
    basilk
    bat
    # bitwig-studio
    btop
    blender
    blockbench
    # bottles # using flatpak
    bluebubbles
    bluetui
    bibletime
    bulletty
    # package to watch/package?
    # https://codeberg.org/janantos/brow6el

    # C
    # cinny-desktop
    calcurse
    cmatrix
    # codeberg-cli # archived
    # concord-discord # needs packaging
    cpufetch

    # D
    dia
    ddgr
    dialog
    discordo
    dmenu-wayland
    dragon-drop
    dunst

    # E
    # enola
    espanso

    # F
    f3
    fastfetch
    ffmpeg
    # fjo # archived
    forgejo-cli
    # fluffychat
    freecad
    fugue-kabmat
    furnace

    # G
    gh
    godot
    goldendict-ng
    graphite
    groff
    gurk-rs

    # H
    havn
    help2man
    heroic
    hyfetch

    # I
    # iamb # crazy compilation time (broken)
    inetutils
    inkscape
    # inputs.yt-x.packages."${system}".default
    isort

    # J

    # K
    # inputs.kabmat
    kanban
    kdePackages.kdenlive
    kjv

    # L
    lazygit
    legcord
    lexy
    lilypond
    # lilgptracker
    localsend
    lue
    # lutris - requires steam

    # M
    man
    man-pages
    mandown
    # manga-cli
    manga-tui
    manix
    # mdbook-man
    # milkytracker
    mpv
    musescore

    # N
    neomutt
    nethack
    nom
    nsxiv
    # this was kinda meh and the config file didn't work
    # (pkgs.writeShellApplication {
    #   name = "ntv";
    #   runtimeInputs = with pkgs; [
    #     fzf
    #     nix-search-tv
    #   ];
    #   # text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    #   text = builtins.readFile "${config.home.homeDirectory}/.local/bin/nixpkgs.sh";
    # })

    # O
    obs-cli
    openscad
    openvpn

    # P
    (pass.withExtensions (e: [
      e.pass-otp
    ]))
    pastel
    penpot-desktop
    pixieditor
    portal
    pqiv
    proton-vpn
    proton-vpn-cli
    pureref

    # Q
    qiv
    # qmlls
    kdePackages.qtdeclarative
    qrencode
    qrtool

    # R
    # reaper
    reddix
    ripgrep
    rgx

    # S
    # schismtracker
    # scli
    sc-im
    sherlock
    # showmethekey
    sioyek
    slides
    solvespace
    # soundtracker
    sox
    streamlink
    streamlink-twitch-gui-bin
    # sway
    swaybg
    stremio-linux-shell # outdated qt-engine dependency

    # T
    tagainijisho
    # taskwarrior3
    # taskwarrior-tui
    tcpdump
    # tealdeer # replace tealdeer
    teensy-loader-cli
    # tic-80 # requires insecure
    # whole buncha tmux plugins
    tlrc
    tintin
    toilet
    tor
    tran
    trash-cli
    tuir
    tukai
    #typing - choose one
    ttyper
    typespeed
    typioca

    # U
    # upower

    # V
    # verse # gonna package this
    vesktop
    vhs
    vimiv-qt

    # W
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
    # wikiman # non-editable sources
    # winboat
    wiki-tui
    wine-wayland
    winetricks
    wiremix

    # X
    xdg-ninja
    xdg-user-dirs
    xdg-desktop-portal-termfilechooser
    xeyes

    # Y
    yewtube
    youtube-tui
    ytfzf
    yt-dlp
    ytdl-sub

    # Z
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

  # programs.man.generateCaches = true;
  services.playerctld.enable = true;
  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
  };

  programs.wallust = {
    enable = true;
  };

  # programs.nix-search-tv = {
  #   enable = true;
  #   enableTelevisionIntegration = true;
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
