{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      mpris
      # mpvacious
      videoclip
      uosc # we like this
    ];
    # syntax
    # [Shift+][Ctrl+][Alt+][Meta+]<key> [{<section>}] <command> ( ; <command> )*

    bindings = {
      "'" = "script-binding commands/open";
      "y" = "nonscalable script-binding uosc/copy-to-clipboard";
      "p" = "nonscalable script-binding uosc/paste";
      "tab" = "script-binding uosc/toggle-ui";
      "space" = "cycle pause; script-binding uosc/ecide-pause-indicator";
      "/" = "script-message-to uosc menu_type_to_search";
      # "/" = "nonscalable script-binding uosc/menu_type_to_search";
      "o" = "script-message-to uosc flash-elements timeline,progress,top_bar,controls";
      "g-x" = "nonscalable script-binding uosc/shuffle";

      # menus
      "ctrl+n" = "nonscalable script-binding uosc/menu-next";
      "ctrl+p" = "nonscalable script-binding uosc/menu-prev";
      "ctrl+j" = "nonscalable script-binding uosc/menu-end";
      "ctrl+k" = "nonscalable script-binding uosc/menu-start";
      "ctrl+l" = "nonscalable cycle-values loop-playlist inf no";
      "g-K" = "nonscalable script-binding uosc/menu-end";
      "g-a" = "nonscalable script-binding uosc/audio";
      "g-c" = "nonscalable script-binding uosc/chapters";
      "g-d" = "nonscalable script-binding uosc/download-subtitles";
      "g-e" = "nonscalable script-binding uosc/editions";
      "g-k" = "nonscalable script-binding uosc/keybinds";
      "g-m" = "nonscalable script-binding uosc/menu";
      "g-o" = "nonscalable script-binding uosc/open-file";
      "g-p" = "nonscalable script-binding uosc/playlist";
      "g-s" = "nonscalable script-binding uosc/subtitles";
      "g-v" = "nonscalable script-binding uosc/video";

      # volume
      "m" = "no-osd cycle mute; nonscalable script-binding uosc/flash-volume";
      "0" = "no-osd add volume 2; nonscalable script-binding uosc/flash-volume";
      "9" = "no-osd add volume -2; nonscalable script-binding uosc/flash-volume";
    };

    scriptOpts = {
      uosc = {
        pause_indicator = "manual";
      };
      console = {
        font_size = 16;
        scale_with_window = "no";
      };
    };

    config = {
      # General QoL improvements
      hwdec = "auto";
      vo = "gpu";
      slang = "en,eng,enUS,en-US";
      sub-auto = "fuzzy";

      osd-scale-by-window = "";

      # what's this?
      sid = 1;

      # Pass cookies to yt-dlp inside mpv
      ytdl-raw-options = "cookies-from-browser=firefox";

      # Force highest quality 1080p video + best audio
      ytdl-format = "bestvideo[vcodec^=avc1][height<=1080]+bestaudio/best";

    };
    profiles = {
      console-subs = {
        profile-desc = "move subs to top when console is open";
        profile-cond = "p['user-data/mpv/console/open']";
        profile-restore = "copy";
        sub-align-y = "top";
      };
    };
  };
}
