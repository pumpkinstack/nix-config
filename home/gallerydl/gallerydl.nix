{ ... }:

{
  programs.gallery-dl = {
    enable = true;
    settings = {
      extractor = {
        base-directory = "~/Downloads";
        archive = "~/Downloads/.gallery-dl-archive.sqlite3";

        # global rate-limiting / retry behavior
        sleep = 1.5; # wait 1.5s between each download
        sleep-request = 0.5; # wait 0.5s between API/page requests
        sleep-429 = 60; # if rate-limited (HTTP 429), wait 60s before retry
        retries = 4; # retry failed downloads up to 4 times
        timeout = 30; # give slow connections more time before failing

        pinterest = {
          videos = true;
          filename = "{board[name]}_{id}.{extension}";
          directory = [
            "pinterest"
            "{board[name]}"
          ];
          image-filter = "width > 100";
        };
      };
    };
  };
}
