{
  config,
  pkgs,
  lib,
  inputs,
  # system,
  ...
}:

let
  fugue-kabmat = (import inputs.kabmat { inherit pkgs; }).kabmat;
  dots = "$XDG_CONFIG_HOME/nixos/current/";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    nvim = "nvim";
    fish = "fish";
  };
in
{
  home.username = "fugue";
  home.homeDirectory = "/home/fugue";
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;

  home.preferXdgDirectories = true;

  # modules
  imports = [
    ./browsers
    ./fuzzel.nix
    ./git.nix
    ./gtk.nix
    ./mpv.nix
    ./neovim.nix
    ./obs.nix
    ./packages.nix
    ./ssh.nix
    ./styling.nix
    ./weechat.nix
    ./xdg
    # ./znc.nix
  ];

  programs.fish = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
  };

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

  programs.yt-dlp = {
    enable = true;
    package = pkgs.yt-dlp.overrideAttrs (
      final: prev: {
        version = "yt-dlp-nightly-2026.08.17.073947";
        src = pkgs.fetchFromGitHub {
          owner = "yt-dlp";
          repo = "yt-dlp";
          rev = "f1896c57f5ba4b92741bb509790837d6838ec99e";
          hash = "sha256-suCz+O7d6DT4ocU/et4gOfhePNaD8mrGEpbfKEOrjr4=";
        };
      }
    );
  };

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
