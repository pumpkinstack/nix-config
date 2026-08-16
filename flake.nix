{
  description = "NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:FlameFlag/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };
  outputs =
    { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          inputs.nix-vscode-extensions.overlays.default
          (import ./overlays)
        ];
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.firelink = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/firelink
          {
            nixpkgs.overlays = [
              inputs.nix-vscode-extensions.overlays.default
              (import ./overlays)
            ];
            nixpkgs.config.allowUnfree = true;
          }
          inputs.hyprland.nixosModules.default
          inputs.home-manager.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.ashenone = import ./home;
            home-manager.backupFileExtension = "bak";
          }
        ];
      };
      devShells.${system} = {
        python = import ./shell/python.nix { inherit pkgs; };
        js = import ./shell/js.nix { inherit pkgs; };
        qml = import ./shell/qml.nix { inherit pkgs; };
      };
    };
}
