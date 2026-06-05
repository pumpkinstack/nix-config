{ ... }:
{
  programs.nixcord.config.plugins = {
    # Shared plugins
    alwaysAnimate.enable = true;
    betterSettings.enable = true;
    ClearURLs.enable = true;
    dearrow.enable = true;
    fakeNitro.enable = true;
    fixImagesQuality.enable = true;
    fixSpotifyEmbeds.enable = true;
    fixYoutubeEmbeds.enable = true;
    friendsSince.enable = true;
    hideMedia.enable = true;
    imageZoom.enable = true;
    MutualGroupDMs.enable = true;
    noMosaic.enable = true;
    petpet.enable = true;
    readAllNotificationsButton.enable = true;
    relationshipNotifier.enable = true;
    revealAllSpoilers.enable = true;
    showConnections.enable = true;
    spotifyCrack.enable = true;
    translate.enable = true;
    userVoiceShow.enable = true;
    validReply.enable = true;
    validUser.enable = true;
    youtubeAdblock.enable = true;

    # Vencord-only plugins
    alwaysExpandRoles.enable = true;
    betterFolders.enable = true;
    typingIndicator.enable = true;
    whoReacted.enable = true;

    # Equicord-only plugins
    betterAudioPlayer.enable = true;
    betterBlockedUsers.enable = true;
    commandPalette.enable = true;
    disableCameras.enable = true;
    gitHubRepos.enable = true;
    themeLibrary.enable = true;
    timezones.enable = true;
    UserPFP.enable = true;
    whosWatching.enable = true;
    zipPreview.enable = true;
  };
}
