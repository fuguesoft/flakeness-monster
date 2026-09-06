{
  pkgs,
  config,
  ...
}:
{
  # requires impure
  # home.file.".config/fish".source = "${config.xdg.configHome}/fish";

  # need this enabled according to nix-direnv
  # but it conveniently overwrites my fish config soooooo....

  programs.fish = {
    enable = false;
  };

  # This is some tony-btw junk that just straight up does not work
  # xdg.configFile."fish" = {
  #   source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/fish";
  #   recursive = true;
  # };
}
