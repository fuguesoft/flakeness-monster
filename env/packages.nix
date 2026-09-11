{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    # A
    # alacritty

    # B
    brightnessctl
    btop

    # C
    chafa
    # inputs.concord.packages.${system}.default
    # inputs.canban."${pkgs.stdenv.hostPlatform.system}".default

    # D

    # E
    elinks

    # F
    fd
    foot
    fprintd

    # G
    git
    gnumake
    gphoto2
    greetd

    # H
    home-manager

    # I
    ifuse
    inxi
    irssi

    # J
    jq

    # K
    killall
    kjv
    kmonad
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

    # L
    # lukesmithxyz-bible-kjv
    libimobiledevice
    linuxPackages.v4l2loopback
    lynx

    # M
    man-pages
    man-pages-posix
    # mango

    # N
    ncdu
    neovim
    nil
    niri
    nmap
    # nixd # old nix formatter
    nudoku

    # O

    # P
    pciutils
    # install pass w/ pass-otp
    (pass.withExtensions (e: [
      e.pass-otp
    ]))
    pinentry-curses
    playerctl
    podman

    # Q
    inputs.qml-niri.packages.${system}.quickshell
    quickshell
    # inputs.qml-niri.packages.${system}.default
    # inputs.qml-niri.packages.${system}.quickshell

    # R
    ripgrep

    # S
    socat

    # T
    timg
    tmux
    tree
    tuigreet

    # U
    unzip
    unrar-free
    usbmuxd
    usbutils
    uxplay

    # V
    v4l-utils
    vifm
    vim

    # W
    w3m
    wayland
    wayland-protocols
    wev
    wget
    wikiman # -- external sources broken
    wl-clipboard

    # X
    # xdg-desktop-portal-termfilechooser
    xurls
    xwayland-satellite

    # Y

    # Z

  ];

}
