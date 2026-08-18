{ pkgs, config, ... }:
{
  programs.chawan = {
    enable = true;
    settings = {
      buffer = {
        images = false;
        # mark-links = false;
        user-style = ''
          *, *::before, *::after { color: revert !important; background-color: revert !important }
        '';
      };
      external = {
        download-dir = "$HOME/descargas/chawan/";
        copy-cmd = "wl-copy";
        paste-cmd = "wl-paste";
        mime-types = "$HOME/.config/mime.types";
      };
      omnirule = {
        ddg = {
          match = "^ddg:";
          substitute-url = ''(x) => "https://noai.duckduckgo.com/lite/?q=" + encodeURIComponent(x.split(":").slice(1).join(":"))'';
        };
      };
      page = {
        S = "() => pager.load('ddg: ')";
        t = "() => pager.load('')";
        T = "() => pager.dupeBuffer()";
        Q = "() => quit()";
        "C-q" = "() => quit()";
        q = "";
        p = "gotoClipboardURL";
        i = "peek";
        o = "peek";
        # "Tab" = "buffer.cursorNextLink";
        # "S-Tab" = "buffer.cursorPrevLink";
        # O = "";
      };
      line = {
        # "M-" = "line.cancel";
        # "C-[" = "line.cancel";
        "M-e" = "line.openEditor";
        Esc = "line.cancel";
      };
      # "siteconf.*" = {
      #   # url = {"*"};
      #   user-style = ''
      #     *, *::before, *::after { color: revert !important; background-color: revert !important }
      #   '';
      # };

    };
  };
}
