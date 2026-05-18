{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.beta
    ./xdg.nix
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    languagePacks = [ "en-US" ];
    policies = import ./policies.nix;

    profiles.zenix = rec {
      mods = [
        "253a3a74-0cc4-47b7-8b82-996a64f030d5" # Floating History
        "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
        "cb15abdb-0514-4e09-8ce5-722cf1f4a20f" # Hide Extension Name
        "72f8f48d-86b9-4487-acea-eb4977b18f21" # Better CtrlTab Panel
        "664c54f9-d97d-410b-a479-23dd8a08a628" # Better Tab Indicators
        "d8b79d4a-6cba-4495-9ff6-d6d30b0e94fe" # Better Active Tab
        "5941aefd-67b0-453d-9b62-9071a31cbb0d" # Smaller Compact Mode
        "58649066-2b6f-4a5b-af6d-c3d21d16fc00" # Private Mode Highlighting
        "1b88a6d1-d931-45e8-b6c3-bfdca2c7e9d6" # Remove Tab X
        "f4866f39-cfd6-4498-ab92-54213b8279dc" # Animations Plus
        "a5f6a231-e3c8-4ce8-8a8e-3e93efd6adec" # Cleaned URL bar
        "ea1a5ace-f698-4b45-ab88-6e8bd3a563f0" # Bookmark Toolbar Tweaks
        "642854b5-88b4-4c40-b256-e035532109df" # Transparent Zen
        "fd24f832-a2e6-4ce9-8b19-7aa888eb7f8e" # Quietify
        "b0f635d7-c3bf-4709-af68-4712f0e5b2e5" # Cleaner Bookmark Menu
        "4596d8f9-f0b7-4aeb-aa92-851222dc1888" # Only Close On Hover
      ];

      search = import ./search.nix { inherit pkgs; };

      settings = {
        "zen.workspaces.continue-where-left-off" = true;
        "zen.workspaces.natural-scroll" = true;
        "zen.view.compact.hide-tabbar" = true;
        "zen.view.compact.animate-sidebar" = true;
        "zen.welcome-screen.seen" = true;
        "zen.urlbar.behavior" = "float";
        "zen.urlbar.replace-newtab" = false;
        "zen.view.show-newtab-button-top" = false;
        "zen.tabs.show-newtab-vertical" = false;
        "zen.theme.dark-mode-bias" = 0.5;
        "browser.startup.page" = 3;
        "browser.sessionstore.resume_from_crash" = true;
        "dom.security.https_only_mode" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "zen.view.use-single-toolbar" = false;
        "zen.view.sidebar-expanded" = false;
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "NixOS";
            url = "https://nixos.org";
          }
        ];
      };

      containersForce = true;
      containers = {
        Personal = {
          color = "purple";
          icon = "fingerprint";
          id = 1;
        };
        Work = {
          color = "yellow";
          icon = "briefcase";
          id = 2;
        };
        Social = {
          color = "orange";
          icon = "chill";
          id = 3;
        };
        Study = {
          color = "orange";
          icon = "circle";
          id = 4;
        };
        Misc = {
          color = "red";
          icon = "fence";
          id = 5;
        };
      };

      spacesForce = true;
      spaces = {
        Study = {
          id = "ff210de6-a0e9-4b40-a759-b6597b1b305a";
          icon = "🕮";
          container = containers."Study".id;
          position = 1000;
        };
        Work = {
          id = "04e4c20a-1083-4cd7-ad3e-14c4ab43288c";
          icon = "💼";
          container = containers."Work".id;
          position = 1001;
        };
        Personal = {
          id = "24c36c6d-b4a9-4a3e-9796-34b4084e87f1";
          icon = "🏠";
          container = containers."Personal".id;
          position = 1002;
        };
        Misc = {
          id = "c773c7b7-5b4c-4ec0-acd4-99a16197b03a";
          icon = "📦";
          container = containers."Misc".id;
          position = 1003;
        };
      };

      pinsForce = true;
      pins = {
        "GitHub" = {
          id = "48e8a119-5a14-4826-9545-91c8e8dd3bf6";
          workspace = spaces."Personal".id;
          url = "https://github.com";
          position = 101;
          isEssential = false;
        };
        "WhatsApp Web" = {
          id = "1eabb6a3-911b-4fa9-9eaf-232a3703db19";
          workspace = spaces."Work".id;
          url = "https://web.whatsapp.com/";
          position = 102;
          isEssential = false;
        };
      };
    };
  };
}
