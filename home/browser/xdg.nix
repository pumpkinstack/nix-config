# home/browser/xdg.nix
{ ... }:
{
  xdg.mimeApps =
    let
      desktopFile = "zen-beta.desktop";
      associations = builtins.listToAttrs (
        map
          (name: {
            inherit name;
            value = desktopFile;
          })
          [
            "application/x-extension-shtml"
            "application/x-extension-xhtml"
            "application/x-extension-html"
            "application/x-extension-xht"
            "application/x-extension-htm"
            "x-scheme-handler/unknown"
            "x-scheme-handler/mailto"
            "x-scheme-handler/chrome"
            "x-scheme-handler/about"
            "x-scheme-handler/https"
            "x-scheme-handler/http"
            "application/xhtml+xml"
            "text/html"
          ]
      );
    in
    {
      associations.added = associations;
      defaultApplications = associations;
    };
}
