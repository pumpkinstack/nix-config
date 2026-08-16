{
  lib,
  python3Packages,
  fetchPypi,
}:

python3Packages.buildPythonPackage rec {
  pname = "colorice";
  version = "0.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qquSJa2P0g18FFIliaI2jGgVIr5YTtSyuLpMowoElVg=";
  };

  build-system = [
    python3Packages.setuptools
  ];

  dependencies = with python3Packages; [
    numpy
    pillow
    scikit-learn
    scikit-image
  ];

  meta = {
    description = "Perceptually accurate wallpaper-to-rice color scheme generator";
    homepage = "https://github.com/rattle99/colorice";
    license = lib.licenses.gpl3Only;
    mainProgram = "colorice";
  };
}
