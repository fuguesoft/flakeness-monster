{ pkgs, ... }:
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 60;
        command = "${pkgs.swalock}/bin/swaylock -fF";
      }
      {
        timeout = 90;
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
