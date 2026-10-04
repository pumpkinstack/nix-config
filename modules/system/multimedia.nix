{ pkgs, ... }:

{
  environment.systemPackages = with pkgs.gst_all_1; [
    gstreamer
    gst-plugins-base
    gst-plugins-good
    gst-plugins-bad
    gst-plugins-ugly
    gst-plugins-rs
    gst-libav
  ];

  environment.profileRelativeSessionVariables.GST_PLUGIN_SYSTEM_PATH_1_0 = [
    "/lib/gstreamer-1.0"
  ];
}
