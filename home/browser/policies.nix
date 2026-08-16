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
  DisablePocket = true;
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
  UserMessaging = {
    WhatsNew = false;
    ExtensionRecommendations = false;
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
    "browser.contentblocking.category" = "custom";
    "browser.download.start_downloads_in_tmp_dir" = true;
    "browser.tabs.warnOnClose" = false;
    "browser.tabs.hoverPreview.enabled" = true;
    "browser.newtabpage.activity-stream.feeds.topsites" = false;
    "browser.topsites.contile.enabled" = false;
    "browser.send_pings" = false;
    "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;

    # tracking protection (list-based, low overhead, site-compatible)
    "privacy.trackingprotection.enabled" = true;
    "privacy.trackingprotection.socialtracking.enabled" = true;
    "privacy.trackingprotection.cryptomining.enabled" = true;
    "privacy.trackingprotection.fingerprinting.enabled" = true;

    # cookie isolation
    "network.cookie.cookieBehavior" = 5;

    # certificate revocation via local CRLite cache (no latency hit)
    "security.OCSP.enabled" = 1;
    "security.remote_settings.crlite_filters.enabled" = true;
    "security.pki.crlite_mode" = 2;

    # no beacons or prefetch
    "beacon.enabled" = false;
    "network.prefetch-next" = false;
    "network.predictor.enabled" = false;
    "network.dns.disablePrefetch" = true;
    "network.dns.disablePrefetchFromHTTPS" = true;

    # misc privacy
    "dom.battery.enabled" = false;
    "signon.formlessCapture.enabled" = false;
    "signon.privateBrowsingCapture.enabled" = false;
    "permissions.default.desktop-notification" = 2;
    "permissions.default.geo" = 2;
    "permissions.manager.defaultsUrl" = "";
    "network.auth.subresource-http-auth-allow" = 1;

    # performance
    "gfx.webrender.all" = true;
    "gfx.canvas.accelerated.cache-size" = 512;
    "gfx.content.skia-font-cache-size" = 20;
    "network.http.http3.enabled" = true;
    "network.http.max-connections" = 1800;

    # network hardening
    "network.socket.ip_addr_any.disabled" = true;
    "network.captive-portal-service.enabled" = false;
    "network.connectivity-service.enabled" = false;

    # extensions
    "extensions.pocket.enabled" = false;
  };
}