{
  programs.fuzzel = {
    enable = true;
    settings = {
      colors.background = "00000039";
      main.terminal = ''
        foot -a "{cmd}" -T "{cmd}" {cmd}
      '';
    };
  };
}
