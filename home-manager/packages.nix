{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    # A
    android-file-transfer
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
    inputs.canban.packages."${pkgs.stdenv.hostPlatform.system}".default
    cmatrix
    inputs.concord.packages."${pkgs.stdenv.hostPlatform.system}".default
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
    freetube
    # fugue-kabmat
    furnace

    # G
    gh
    ghgrab
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
    inputs.iamb-vaw.packages."${pkgs.stdenv.hostPlatform.system}".default
    inetutils
    inkscape
    isort

    # J
    # jmtpfs

    # K
    kdePackages.kdenlive
    kjv

    # L
    lazygit
    legcord
    lexy
    lilypond
    # lilgptracker
    # lutris - requires steam

    # M
    magic-wormhole # goated frfr
    man
    man-pages
    mandown
    # manga-cli
    manga-tui
    manix
    # mdbook-man
    # milkytracker
    musescore

    # N
    neomutt
    nethack
    nom
    nsxiv

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
    qman
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
    tcpdump
    teensy-loader-cli
    # tic-80 # requires insecure
    # whole buncha tmux plugins
    tlrc
    tintin
    toilet
    tor
    trash-cli
    # tuir # reddit
    ttyper
    twitch-tui
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
    wtwitch

    # X
    xdg-ninja
    xdg-user-dirs
    xdg-desktop-portal-termfilechooser
    xeyes

    # Y
    yewtube
    youtube-tui
    ytfzf
    ytdl-sub

    # Z
    zbar
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "affinity-v3"
      "affinity-extracted-sources"
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
}
