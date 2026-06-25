{ pkgs, config, ... }:
{
  programs.chawan = {
    enable = true;
    settings = {
      page = {
        T = "() =&gt; pager.load('ddg:')";
      };

    };
  };
}
