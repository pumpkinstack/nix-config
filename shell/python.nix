{ pkgs, ... }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    gtk3
    gobject-introspection
    (python3.withPackages (
      ps: with ps; [
        pygobject3
        tkinter
        pip
        pillow
        requests
      ]
    ))
  ];

  shellHook = ''
    echo "Python dev shell ready"
  '';
}
