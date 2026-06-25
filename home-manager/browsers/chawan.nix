{ pkgs, config, ... }:
{
  programs.chawan = {
    enable = true;
    settings = {
      page = {
        s = "() => pager.load('ddg:')";
        t = "() => pager.load";
      };

    };
  };
}
