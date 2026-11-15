{
  lib,
  appimageTools,
  fetchurl,
  makeDesktopItem,
}:

let
  pname = "photocraft";
  version = "0.23.1";

  src = fetchurl {
    url = "https://github.com/storytold/photocraft/releases/download/v${version}/photocraft-${version}-linux-x86_64.AppImage";
    hash = "sha256-BXR7PlJ+HgoMHeOZcDYc84yPyn6NPjYB7yCC+w5t0X8=";
  };

  # unpacked copy, only used to grab the icon
  contents = appimageTools.extract { inherit pname version src; };

  desktopItem = makeDesktopItem {
    name = "photocraft";
    desktopName = "PhotoCraft";
    genericName = "Image Editor";
    comment = "Open-source layered image editor";
    exec = "photocraft %F";
    icon = "ai.storyteller.photocraft";
    categories = [
      "Graphics"
      "2DGraphics"
      "RasterGraphics"
    ];
    startupWMClass = "ai.storyteller.photocraft";
    mimeTypes = [
      "image/png"
      "image/jpeg"
      "image/webp"
      "image/vnd.adobe.photoshop"
    ];
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  # wgpu / winit dlopen these at runtime
  extraPkgs =
    p: with p; [
      vulkan-loader
      libGL
      libxkbcommon
      wayland
      libX11
      libXcursor
      libXrandr
      libXi
      libxcb
      fontconfig
      freetype
      gtk3
      alsa-lib
    ];

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    ln -s ${desktopItem}/share/applications/*.desktop $out/share/applications/

    # best-effort icon install from the AppImage contents
    icon=$(find ${contents} -name 'ai.storyteller.photocraft.png' | head -n1 || true)
    if [ -n "$icon" ]; then
      install -Dm444 "$icon" $out/share/icons/hicolor/256x256/apps/ai.storyteller.photocraft.png
    fi
  '';

  meta = {
    description = "Open-source, clean-room Photoshop-style image editor written in Rust";
    homepage = "https://github.com/storytold/photocraft";
    license = with lib.licenses; [
      mit
      asl20
    ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "photocraft";
  };
}
