{ pkgs, ... }:
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 3600;
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
      {
        timeout = 10800;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
  programs.swaylock = {
    enable = true;
    settings = {
      # settings here
      color = "233948";

    };
  };
}
