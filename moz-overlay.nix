# This overlay extends nixpkgs with a few mozilla packages.
self: super:

let
  callPackage = super.lib.callPackageWith super;
in

{
  rustPlatform = super.rustUnstable;

  gecko = callPackage ./pkgs/gecko { };

  servo = callPackage ./pkgs/servo { };

  firefox-dev-bin = callPackage ./pkgs/firefox-bin/dev.nix { pkgs = super; };
  firefox-nightly-bin = callPackage ./pkgs/firefox-bin/nightly.nix { pkgs = super; };

  VidyoDesktop = callPackage ./pkgs/VidyoDesktop { nixpkgs = super; };
}
