{
  inputs = {
    # This is pointing to an unstable release.
    # If you prefer a stable release instead, you can this to the latest number shown here: https://nixos.org/download
    # i.e. nixos-24.11
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    # mnw.url = "github:Gerg-L/mnw";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    qml-niri = {
      url = "github:imiric/qml-niri/main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
    concord = {
      url = "github:chojs23/concord";
    };
    yt-x = {
      url = "github:Benexl/yt-x";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kabmat = {
      url = "github:fuguesoft/packaging-practice";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      # mnw,
      home-manager,
      # quickshell,
      # qml-niri,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nixosSystem = nixpkgs.lib.nixosSystem;
      homeManagerConfiguration = home-manager.lib.homeManagerConfiguration;
    in
    {
      # NOTE: 'nixos' is the default hostname
      nixosConfigurations = {
        indigo = nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./configuration.nix
            ./desktop
          ];
        };
        # another hostname
      };
      homeConfigurations = {
        "fugue" = homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./home-manager/home.nix
            # mnw.homeManagerModules.mnw
          ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
      };
    };
}
