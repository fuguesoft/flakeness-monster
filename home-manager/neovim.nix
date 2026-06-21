{
  config,
  pkgs,
  lib,
  ...
}:
{

  # This is for wrapping to avoid using lazy. We'll figure it out on the daily
  # driver.

  # programs.mnw = {
  #   enable = true;
  #   initLua = ''
  #     require{"myconfig"}
  #   '';
  #   plugins = {
  #     start = [
  #       pkgs.vimPlugins.oil-nvim
  #     ];
  #     dev.myconfig = {
  #       pure = ./nvim;
  #     };
  #   };
  # };

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    sideloadInitLua = true;

    extraPackages = with pkgs; [
      black
      deno
      fish-lsp
      gcc
      gdscript-formatter
      gdtoolkit_4
      haskell-language-server
      lua-language-server
      luajitPackages.lua-lsp
      mypy
      prettierd
      pylint
      pyright
      stylua
      tree-sitter
      typescript-language-server
      yaml-language-server
      # rnix-lsp
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      # fff-nvim
    ];
    withRuby = false;
    withPython3 = true;
  };
}
