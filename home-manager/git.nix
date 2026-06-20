{
  programs.git = {
    enable = true;
    settings = {
      core.editor = "nvim";
      user = {
        name = "fuguesoft";
        email = "31870368+fuguesoft@users.noreply.github.com";
      };
      includeIf = {
        "gitdir:~/documentos/personal/portfolio/".path = "~/documentos/personal/.gitconfig";
      };
      init.defaultbranch = "main";
    };
  };

  programs.gh = {
    enable = true;
    settings = {
      telemetry = false;
      doNotTrack = true;
    };
  };

  # Git
  # programs.git = {
  #   enable = true;
  #   userName = "";
  #   userEmail = "";
  #   aliases = {
  #     alias1 = "git command1";
  #     alias2 = "git command2";
  #     alias3 = "git command3";
  #   };
  # };

  # Removed due to required upstream changes
  #
  # programs.glab = {
  #   enable = true;
  # };
}
