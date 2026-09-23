{
  programs.qutebrowser = {
    enable = true;
    # loadAutoconfig = true;
    settings = {
      colors.webpage.darkmode.enabled = true;
      session.lazy_restore = true;
      input.insert_mode.auto_load = true;
      input.insert_mode.leave_on_load = true;
      qt.highdpi = true;
      window.hide_decoration = true;
      window.transparent = true;
      fonts.default_size = "13pt";
      fonts.web.size = {
        default = 13;
        default_fixed = 13;
        minimum_logical = 13;
      };
      tabs = {
        width = 25;
        # indicator.padding = "";
        favicons.scale = 1.2;
        # how does one pass this table with string values inside?
        # do they need to be escaped?
        # padding = ''{"bottom": 8, "left": 0, "right": 5, "top": 8};'';
        position = "left";
        last_close = "close";
        title.format = "{audio}";
      };
      # editor.command = ["nvim" "-f" "{file}" "-c" "normal {line}G{column0}1"];
      url = {
        default_page = "https://noai.duckduckgo.com/";
        start_pages = [ "https://noai.duckduckgo.com/" ];
      };
    };
    searchEngines = {
      "DEFAULT" = "noai.duckduckgo.com/?q={}";
    };
  };
}
