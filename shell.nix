with import ./nix/pin.nix { };
stdenv.mkDerivation {
  name = "elm-result-validators";
  buildInputs = [
    elmPackages.elm
    elmPackages.elm-live
    elmPackages.elm-format
    elmPackages.elm-analyse
    elmPackages.elm-test
    elmPackages.elm-doc-preview
    elm2nix
  ];
}
