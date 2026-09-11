{
  pkgs,
  lib,
  config,
  ...
}:
{

  environment.sessionVariables = rec {
    EDITOR = "nvim";
    VISUAL = "nvim";

    LESS = "-R";
    MANPAGER = "less +Gg -M -R -I --use-color -Dd+r -Du+b";

    XDG_CACHE_HOME = "$HOME/.cache";
    GNUPGHOME = "${XDG_DATA_HOME}\/gnupg";

    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_BIN_HOME = "$HOME/.local/bin";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_DESKTOP_DIR = "$HOME/escritorio";
    XDG_DOCUMENTS_DIR = "$HOME/documentos";
    XDG_DOWNLOAD_DIR = "$HOME/descargas";
    XDG_MUSIC_DIR = "$HOME/música";
    XDG_PICTURES_DIR = "$HOME/imágenes";
    XDG_PUBLICSHARE_DIR = "$HOME/público";
    XDG_STATE_HOME = "$HOME\/.local/state";
    XDG_TEMPLATES_DIR = "$HOME/plantillas";
    XDG_VIDEOS_DIR = "$HOME/vídeos";

    # What's the syntax here for defining this?
    # Use `rec`
    HISTFILE = "${XDG_STATE_HOME}\/bash/history";
    NIRIDOC = "${pkgs.niri.doc}/share/doc/niri/wiki";
    # getDoc is darwin only
    # NIRIDOC = "${pkgs.lib.getDoc pkgs.niri}/share/doc/niri/wiki";
    PASSWORD_STORE_DIR = "${XDG_DATA_HOME}\/pass";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
    # qml-niri (absolute nonsense, don't do this)
    # system = pkgs.stdenv.hostPlatform.system;
    # QT_PLUGIN_PATH = [
    #   inputs.qml-niri.packages.${system}.default
    # ];
    PARALLEL_HOME = "${XDG_CONFIG_HOME}/parallel";
    PYTHON_HISTORY = "${XDG_STATE_HOME}\/python_history";
    SUDO_ASKPASS = "${XDG_BIN_HOME}\/_askpass.sh";
    W3M_DIR = "${XDG_DATA_HOME}\/w3m";
    WINEPREFIX = "${XDG_DATA_HOME}/wine";
    XCOMPOSECACHE = "${XDG_CACHE_HOME}\/X11/xcompose";
  };

}
