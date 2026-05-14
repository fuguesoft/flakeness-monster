{ pkgs, ... }:
{
  # Gtk

  # gtk = {
  #   enable = true;
  #   theme.name = "adw-gtk3";
  #   cursorTheme.name = "Bibata-Modern-Ice";
  #   iconTheme.name = "GruvboxPlus";
  # };

  gtk = {
    enable = true;
    # iconTheme = { };
    gtk3 = {
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };

      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
    gtk4.theme = null;
  };
}
