{ pkgs, ... }:

{
  force = true;
  default = "ddg";
  privateDefault = "ddg";

  engines =
    let
      nixSnowflakeIcon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    in
    {
      "Nix Packages" = {
        urls = [
          {
            template = "https://search.nixos.org/packages";
            params = [
              {
                name = "type";
                value = "packages";
              }
              {
                name = "channel";
                value = "unstable";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = nixSnowflakeIcon;
        definedAliases = [ "np" ];
      };

      "Nix Options" = {
        urls = [
          {
            template = "https://search.nixos.org/options";
            params = [
              {
                name = "channel";
                value = "unstable";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = nixSnowflakeIcon;
        definedAliases = [ "no" ];
      };

      "Home Manager Options" = {
        urls = [
          {
            template = "https://home-manager-options.extranix.com/";
            params = [
              {
                name = "query";
                value = "{searchTerms}";
              }
              {
                name = "release";
                value = "master"; # unstable
              }
            ];
          }
        ];
        icon = nixSnowflakeIcon;
        definedAliases = [ "hmop" ];
      };

      "NixOS Wiki" = {
        urls = [
          {
            template = "https://wiki.nixos.org";
            params = [
              {
                name = "search";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = nixSnowflakeIcon;
        definedAliases = [ "nw" ];
      };

      "Noogle" = {
        urls = [
          {
            template = "https://noogle.dev/q";
            params = [
              {
                name = "term";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = nixSnowflakeIcon;
        definedAliases = [ "ng" ];
      };

      "ddg" = {
        urls = [
          {
            template = "https://duckduckgo.com";
            params = [
              {
                name = "q";
                value = "{searchTerms}";
              }
              {
                name = "origin";
                value = "Greetings";
              }
            ];
          }
        ];
        icon = "https://duckduckgo.com/favicon.ico";
        definedAliases = [
          "duck"
          "ddg"
          "dck"
          "dckk"
        ];
      };
    };
}
