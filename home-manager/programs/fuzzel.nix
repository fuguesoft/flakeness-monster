{
  programs.fuzzel = {
    enable = true;
    settings = {
      colors.background = "00000099";
      main.terminal = ''
        foot -a "{cmd}" -T "{cmd}" {cmd}
      '';
    };
  };
}
