{
  pkgs,
  lib,
  config,
  ...
}:
{

  imports = [
    ./packages.nix
    ./variables.nix
  ];

  environment = {

    wordlist = {
      enable = true;
      lists = {
        WORDLIST = [ "${pkgs.scowl}/share/dict/words.txt" ];
      };
    };

    # resolve conflict between keyd and libinput that interferes with dwt
    # see ../keyboard/keyd.nix
    etc = {
      "libinput/local-overrides.quirks".text = pkgs.lib.mkForce ''
        [Serial Keyboards]
        MatchUdevType=keyboard
        MatchName=keyd virtual keyboard
        AttrKeyboardIntegration=internal
      '';
    };

  };

}
