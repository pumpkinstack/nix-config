{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # CLI utilities
    wget
    curl
    git
    btop
    tree
    man-pages
    ripgrep
    lsd
    bat
    yazi

    # Archive tools
    unzip
    zip
    p7zip
    unrar

    # File / device management
    gvfs
    mtpfs
    libmtp

    # System / hardware
    brightnessctl

    # Nix tooling
    nixfmt
    nixd
    nurl

    # Language servers
    pyright
    vtsls
    vscode-langservers-extracted

    # Formatters / linters
    ruff
    stylua
    prettier
    shfmt
    clang-tools

    # Build tools
    cmake
  ];
}
