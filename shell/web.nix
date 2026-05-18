{ pkgs, ... }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    yarn
    eslint
    typescript
  ];

  shellHook = ''
    echo "🟨 JavaScript/Node.js dev shell ready"
    echo "Node version: $(node -v)"
    echo "NPM version: $(npm -v)"
  '';
}
