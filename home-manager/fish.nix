{
  pkgs,
  config,
  ...
}:
{
  # requires impure
  # home.file.".config/fish".source = "${config.xdg.configHome}/fish";

  # need this enabled according to nix-direnv
  # but it conveniently overwrites my fish config soooooo....

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if status is-interactive
        # Commands to run in interactive sessions can go here
      end

      fish_vi_key_bindings

      # "Native" !! and !$ from bash

      # # !!
      function bind_bang
        switch (commandline -t)[-1]
          case "!"
            commandline -t -- $history[1]
            commandline -f repaint
          case "*"
              commandline -i !
        end
      end

      function bind_dollar
        switch (commandline -t)[-1]
          case "!"
            commandline -f backward-delete-char history-token-search-backward
          case "*"
            commandline -i '$'
        end
      end

      #!$
      function fish_user_key_bindings
        bind ! bind_bang
        bind '$' bind_dollar
      end

      bind -M insert ! bind_bang
      bind -M insert '$' bind_dollar

      bind -M insert -m default ii backward-char force-repaint
      set -g fish_sequence_key_delay_ms 300
    '';

  };

  # This is some tony-btw junk that just straight up does not work
  # xdg.configFile."fish" = {
  #   source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/fish/config.fish";
  #   recursive = true;
  # };
}
