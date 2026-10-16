{ pkgs, ... }:
{

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-termfilechooser
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];

    config = {
      common = {
        default = [
          # "niri"
          "wlr"
        ];
        "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
        "org.freedesktop.impl.portal.ScreenCast" = "wlr";
        "org.freedesktop.impl.portal.Screenshot" = "wlr";
      };

      niri = {
        default = [
          "wlr"
          # "gtk4"
          # "gnome"
        ];
        "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
        "org.freedesktop.impl.portal.ScreenCast" = "gnome";
        "org.freedesktop.impl.portal.Screenshot" = "gnome";
        "org.freedesktop.impl.portal.RemoteDesktop" = "gnome";
      };
    };
  };

  xdg.configFile = {

    "xdg-desktop-portal-termfilechooser/config" = {
      force = true;
      executable = true;
      # enable = true;
      # how can I make this look nicer with an 80 char wrap?
      text = ''
        [filechooser]
        cmd=$XDG_CONFIG_HOME/xdg-desktop-portal-termfilechooser/v-wrap.sh
        default_dir=$XDG_DOWNLOAD_DIR
        create_help_file=1
        env=TERMCMD="${pkgs.foot}/bin/foot"
        env=PATH="$PATH:/run/current-system/sw/bin"
        open_mode=suggested
        save_mode=last
      '';
    };

    "xdg-deskop-portal-wlr/$XDG_CURRENT_DESKTOP" = {
      force = true;
      executable = true;
      text = ''
        [screencast]
        name=eDP-1
        max_fps=30
        exec_before=dunstctl set-paused true
        exec_after=dunstctl set-paused false
        chooser_type=simple
        chooser_cmd="${pkgs.fuzzel}/bin/fuzzel -p 'Monitor: %o'"
      '';
    };

  };

  xdg.desktopEntries = {
    mvi = {
      name = "mvi";
      genericName = "Photo Viewer";
      exec = "mvi %U";
      categories = [
        "Graphics"
        "Utility"
      ];
      mimeType = [ "image/*" ];
    };

    # nsxiv-gallery = {
    #   name = "nsxiv-gallery";
    #   genericName = "Photo Viewer";
    #   exec = "nsxiv -r %U";
    #   categories = [
    #     "Graphics"
    #     "Utility"
    #   ];
    #   mimeType = [ "image/*" ];
    # };
  };

  # MIMETYPES
  imports = [
    ./mimetypes.nix
  ];
}
