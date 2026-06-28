let
  mkLockedAttrs = builtins.mapAttrs (
    _: value: {
      Value = value;
      Status = "locked";
    }
  );

  mkPluginUrl = id: "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";

  mkExtensionEntry =
    {
      id,
      pinned ? false,
    }:
    let
      base = {
        install_url = mkPluginUrl id;
        installation_mode = "force_installed";
      };
    in
    if pinned then base // { default_area = "navbar"; } else base;

  mkExtensionSettings = builtins.mapAttrs (
    _: entry: if builtins.isAttrs entry then entry else mkExtensionEntry { id = entry; }
  );
in
{
  AutofillAddressEnabled = true;
  AutofillCreditCardEnabled = false;
  DisableAppUpdate = true;
  DisableFeedbackCommands = true;
  DisableFirefoxStudies = true;
  DisablePocket = true; # save webs for later reading
  DisableTelemetry = true;
  DontCheckDefaultBrowser = true;
  OfferToSaveLogins = false;
  EnableTrackingProtection = {
    Value = true;
    Locked = true;
    Cryptomining = true;
    Fingerprinting = true;
  };
  SanitizeOnShutdown = {
    FormData = true;
    Cache = true;
  };
  ExtensionSettings = mkExtensionSettings {
    "{446900e4-71c2-419f-a6a7-df9c091e268b}" = mkExtensionEntry {
      id = "bitwarden-password-manager";
      pinned = true;
    };
    "uBlock0@raymondhill.net" = mkExtensionEntry {
      id = "ublock-origin";
      pinned = true;
    };
    "vpn@proton.ch" = mkExtensionEntry {
      id = "proton-vpn-firefox-extension";
      pinned = true;
    };
    "addon@darkreader.org" = mkExtensionEntry {
      id = "darkreader";
      pinned = true;
    };
    "{91aa3897-2634-4a8a-9092-279db23a7689}" = mkExtensionEntry {
      id = "zen-internet";
      pinned = true;
    };
    "{4f391a9e-8717-4ba6-a5b1-488a34931fcb}" = "bonjourr-startpage";
    "{74145f27-f039-47ce-a470-a662b129930a}" = "clearurls";
    "jid1-BoFifL9Vbdl2zQ@jetpack" = "decentraleyes";
  };
  Preferences = mkLockedAttrs {
    "browser.aboutConfig.showWarning" = false;
    "browser.contentblocking.category" = "strict";
    "browser.download.start_downloads_in_tmp_dir" = true;
    "browser.tabs.warnOnClose" = false;
    "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
    "browser.tabs.hoverPreview.enabled" = true;
    "browser.newtabpage.activity-stream.feeds.topsites" = false;
    "browser.topsites.contile.enabled" = false;

    "privacy.resistFingerprinting" = true;
    "privacy.resistFingerprinting.randomization.canvas.use_siphash" = true;
    "privacy.resistFingerprinting.randomization.daily_reset.enabled" = true;
    "privacy.resistFingerprinting.randomization.daily_reset.private.enabled" = true;
    "privacy.resistFingerprinting.block_mozAddonManager" = true;
    "privacy.spoof_english" = 1;

    "network.cookie.cookieBehavior" = 5;
    "dom.battery.enabled" = false;

    "gfx.webrender.all" = true;
    "gfx.canvas.accelerated.cache-size" = 512;
    "gfx.content.skia-font-cache-size" = 20;
    "network.http.http3.enabled" = true;
    "network.socket.ip_addr_any.disabled" = true;
    "network.auth.subresource-http-auth-allow" = 1;
    "network.captive-portal-service.enabled" = false;
    "network.connectivity-service.enabled" = false;
    "network.dns.disablePrefetch" = true;
    "network.dns.disablePrefetchFromHTTPS" = true;
    "network.http.max-connections" = 1800;
    "permissions.default.desktop-notification" = 2;
    "permissions.default.geo" = 2;
    "security.OCSP.enabled" = 0;
    "signon.formlessCapture.enabled" = false;
    "signon.privateBrowsingCapture.enabled" = false;
    "permissions.manager.defaultsUrl" = "";
    "extensions.autoDisableScopes" = 0;
    "extensions.pocket.enabled" = false;
  };
}
