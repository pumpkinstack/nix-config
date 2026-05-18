{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };

    hyprland.url = "github:hyprwm/Hyprland/v0.55.0";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      hyprland,
      sops-nix,
      ...
    }:
    let
      system = "x86_64-linux";
      specialArgs = { inherit inputs system; };
    in
    {
      nixosConfigurations.leyndell = nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = [
          ./hosts/leyndell
          { nixpkgs.config.allowUnfree = true; }
          sops-nix.nixosModules.sops
          hyprland.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.backupFileExtension = "backup";
            home-manager.users.tarnished = import ./home;
          }
        ];
      };
    };
}
