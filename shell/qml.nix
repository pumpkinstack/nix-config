{ pkgs, ... }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtsvg
    qt6.qtimageformats
    qt6.qtmultimedia
    qt6.qtshadertools
    qt6.qt5compat
  ];

  shellHook = ''
    echo "🟦 QML/Qt dev shell ready"
    echo "Qt version: $(qmake6 --version)"
  '';
}
