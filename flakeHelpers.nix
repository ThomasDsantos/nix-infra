inputs:
let
  homeManagerCfg = userPackages: extraImports: {
    home-manager.useGlobalPkgs = false;
    home-manager.extraSpecialArgs = {
      inherit inputs;
    };
    home-manager.users.thdo.imports = [
      ./users/thdo/dots.nix
    ] ++ extraImports;
    home-manager.backupFileExtension = "bak";
    home-manager.useUserPackages = userPackages;
  };
in
{

  # mkDarwin = machineHostname: nixpkgsVersion: extraHmModules: extraModules: {
  #   darwinConfigurations.${machineHostname} = inputs.nix-darwin.lib.darwinSystem {
  #     system = "aarch64-darwin";
  #     specialArgs = {
  #       inherit inputs;
  #     };
  #     modules = [
  #       "${inputs.secrets}/default.nix"
  #       inputs.agenix-darwin.darwinModules.default
  #       ./machines/darwin
  #       ./machines/darwin/${machineHostname}
  #       inputs.home-manager-unstable.darwinModules.home-manager
  #       (nixpkgsVersion.lib.attrsets.recursiveUpdate (homeManagerCfg true extraHmModules) {
  #         home-manager.users.notthebee.home.homeDirectory = nixpkgsVersion.lib.mkForce "/Users/notthebee";
  #       })
  #     ];
  #   };
  # };
  mkNixos = machineHostname: nixpkgsVersion: extraModules: rec {
    deploy.nodes.${machineHostname} = {
      hostname = machineHostname;
      profiles.system = {
        user = "root";
        sshUser = "thdo";
        path = inputs.deploy-rs.lib.x86_64-linux.activate.nixos nixosConfigurations.${machineHostname};
      };
    };
    nixosConfigurations.${machineHostname} = nixpkgsVersion.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        # vars = import ./machines/nixos/vars.nix;
      };
      modules = [
        ./machines/nixos/_common
        ./machines/nixos/${machineHostname}
        ./users/thdo
        (homeManagerCfg false [ ])
      ] ++ extraModules;
    };
  };
  mkMerge = inputs.nixpkgs.lib.lists.foldl' (
    a: b: inputs.nixpkgs.lib.attrsets.recursiveUpdate a b
  ) { };
}

