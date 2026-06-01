{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    extraConfig = ''
      #znc-for-now
      Host nixos-server
        # Hostname nixos-server
        Hostname 192.168.0.187
        Port 5454
        User fugue
        IdentityFile ~/.ssh/znc_ed25519
        IdentitiesOnly yes
        
      #homelab
      Host konohagakure
        Hostname 192.168.0.133
        User fugue
        IdentityFile ~/.ssh/change_ed25519
        IdentitiesOnly yes

      #homelab
      Host change-me
      # Hostname 192.168.1.111
        User fugue
        IdentityFile ~/.ssh/change_ed25519
        IdentitiesOnly yes

      # Personal github account
      Host github.com
        HostName github.com
        User git
        IdentityFile ~/.ssh/hub_ed25519_nix
        IdentitiesOnly yes

      # Personal gitlab account
      Host gitlab.com freedesktop.org
        HostName gitlab.com
        User git
        IdentityFile ~/.ssh/_lab_ed25519
        IdentitiesOnly yes

      # Personal codeberg account
      Host codeberg.org
        Hostname codeberg.org
        User git
        IdentityFile ~/.ssh/_berg_ed25519
        IdentitiesOnly yes

      Host *
        ControlMaster auto
        # ControlPath ~/.ssh/sockets/%r@%h-%p
        ControlPersist 600
        AddKeysToAgent yes
    '';
    # matchBlocks."*" = { };

  };

}
