{
  services.znc = {
    config = {
      LoadModule = [
        "adminlog"
        "webadmin"
      ];
      User.fugue = {
        Admin = true;
        Nick = "fugue";
        AltNick = "fugue_";
        # Research Modules
        LoadModule = [
          "chansaver"
        ];
        Network = {
          libera = {
            Chan = {
              "#nixos" = { };
              "#debian" = { };
              "#nixos-wiki" = { };
            };
            # Research Modules
            JoinDelay = 2;
            LoadModule = [
              # "cert"
              "keepnick"
              "kickrejoin"
              # "nickserv xedxem-rowRib-4forja"
              "sasl"
              "simple_away"
            ];
            Server = "irc.libeera.chat +6697";
          };
        };
        Pass.password = {
          Method = "sha256"; # what methods are available?
          Hash = "dc04ed88a4bbf0e5fa1604d88425c3263a43ac6d991684374f69da563196df25"; # generated hash from guide
          Salt = "ybY/aj.:39F+y,N75i0o"; # how do I get this?
        };
      };
    };
  };

}
