{
  lib,
  config,
  dream2nix,
  ...
}: {
  imports = [
    dream2nix.modules.dream2nix.nodejs-package-lock-v3
    dream2nix.modules.dream2nix.nodejs-granular-v3
  ];

  mkDerivation = {
    src = config.deps.fetchFromGitHub {
      owner = "fedwiki";
      repo = "wiki";
      rev = "v0.33.0";
      sha256 = "sha256-5PD06h+ML6+7Ae/1uvyt3mAIBIUC1fFQEjP73E9IlfM=";
    };
  };

  deps = {nixpkgs, ...}: {
    inherit
      (nixpkgs)
      fetchFromGitHub
      stdenv
      ;
  };

  nodejs-package-lock-v3 = {
    packageLockFile = "${config.mkDerivation.src}/package-lock.json";
  };

  name = "wiki";
  version = "0.33.0";
}
