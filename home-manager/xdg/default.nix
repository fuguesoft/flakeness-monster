{ pkgs, ... }:
{

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-termfilechooser
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
    ];

    config = {
      common = {
        default = [
          "niri"
        ];
        "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
      };
      niri = {
        default = [
          # "gtk"
          # "gnome"
        ];
        "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
        "org.freedesktop.impl.portal.ScreenCast" = "gnome";
        "org.freedesktop.impl.portal.Screenshot" = "gnome";
        "org.freedesktop.impl.portal.RemoteDesktop" = "gnome";
      };
    };
  };

  xdg.configFile."xdg-desktop-portal-termfilechooser/config" = {
    force = true;
    # enable = true;
    # how can I make this look nicer with an 80 char wrap?
    text = ''
      [filechooser]
      cmd=$XDG_CONFIG_HOME/xdg-desktop-portal-termfilechooser/v-wrap.sh
      default_dir=$XDG_DOWNLOAD_DIR
      env=TERMCMD="${pkgs.foot}/bin/foot"
    '';
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

  # xdg.mimeApps.defaultApplications = {
  #   "text/plain" = ["neovide.desktop"];
  #   "application/pdf" = ["sioyek.desktop"];
  #   "image/*" = ["neovide.desktop"];
  #   "video/png" = ["mpv.desktop"];
  #   "video/jpg" = ["mpv.desktop"];
  #   "video/*" = ["mpv.desktop"];
  # };

  imports = [
    ./mimetypes.nix
  ];
}
