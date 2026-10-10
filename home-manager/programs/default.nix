{
  pkgs,
  lib,
  inputs,
  ...
}:
{

  imports = [
    ./browsers
    ./fish.nix
    ./fuzzel.nix
    ./git.nix
    ./gtk.nix
    ./mpv.nix
    ./neomutt.nix
    ./neovim.nix
    ./obs.nix
    ./packages.nix
    ./ssh.nix
    ./styling.nix
    ./streamlink.nix
  ];

}
