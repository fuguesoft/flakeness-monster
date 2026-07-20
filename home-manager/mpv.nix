{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      mpris
      # crop
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
      "/" = "nonscalable script-binding uosc/menu_type_to_search";
      "o" = "script-message-to uosc flash-elementsimeline,progress,top_bar,controls";
      "g-x" = "nonscalable script-binding uosc/shuffle";
      # "o" = "nonscalable script-message-to uosc flash-elements progress,top_bar";

      # menus
      "Ctrl+n" = "nonscalable script-binding uosc/menu-next";
      "Ctrl+p" = "nonscalable script-binding uosc/menu-prev";
      "ctrl+j" = "nonscalable script-binding uosc/meny-end";
      "ctrl+k" = "nonscalable script-binding uosc/menu-start";
      "g-K" = "nonscalable script-binding uosc/menu-end";
      "g-a" = "nonscalable script-binding uosc/audio";
      "g-c" = "nonscalable script-binding uosc/chapters";
      "g-d" = "nonscalable script-binding uosc/download-subtitles";
      "g-e" = "nonscalable script-binding uosc/editions";
      "g-k" = "nonscalable script-binding uosc/keybinds";
      "g-l" = "nonscalable set loop-playlist inf";
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
        # "loop-playlist" = true;
      };
    };

    # waylandSupport = true;
    # mpv = pkgs.mpv.override {
    #   waylandSupport = true;
    # };
    # config = {};
  };
}
