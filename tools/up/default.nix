# This file was generated by https://github.com/kamilchm/go2nix v1.3.0
{
  stdenv,
  buildGoPackage,
  fetchgit,
  fetchhg,
  fetchbzr,
  fetchsvn,
}:
buildGoPackage rec {
  name = "up-unstable-${version}";
  version = "2018-10-31";
  rev = "804be3cfb8982f83e850f28bef5730672b6d04da";

  goPackagePath = "github.com/akavel/up";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/akavel/up";
    sha256 = "171bwbk2c7jbi51xdawzv7qy71492mfs9z5j0a5j52qmnr4vjjgs";
  };

  goDeps = ./deps.nix;

  # TODO: add metadata https://nixos.org/nixpkgs/manual/#sec-standard-meta-attributes
  meta = {
  };
}
