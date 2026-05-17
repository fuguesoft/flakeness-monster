{
  imports = [
    ./sway.nix
    # ./kde.nix
    ./niri.nix
    ./mango.nix
  ];


  services = {
    desktopManager.plasma6.enable = false;
    displayManager.ly = {
      enable = true;
      settings = {
        animation = "matrix";
        bigclock = "en";
        # bigclock_seconds = true;
        blank_box = true;
        lang = "es";
        ly_log = "/home/fugue/.local/state/ly.log";
        session_log = "/home/fugue/.local/state/ly-session.log";
        vi_mode = true;
      };
    };
  };
}
