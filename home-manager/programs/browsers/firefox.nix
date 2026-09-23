{ pkgs, config, ... }:
{
  programs.firefox = {
    enable = true;

    languagePacks = [
      "es-ES"
      "en-GB"
      "jp"
    ];

    nativeMessagingHosts = with pkgs; [
      tridactyl-native
    ];

    configPath = "${config.xdg.configHome}/mozilla/firefox";

    # nativeMessagingHosts = [];

    policies = {
      Cookies = {
        "Allow" = [
          "http://ableton.com"
          "http://alchemyrpg.com"
          "http://amazon.com"
          "http://blender.org"
          "http://codeberg.org"
          "http://framework.com"
          "http://gdquest.com"
          "http://github.com"
          "http://gitlab.com"
          "http://reddit.com"
          "http://tsuki.games"
          "http://twitch.tv"
          "http://udemy.com"
          "http://yagpdb.xyz"
          "http://youtube.com"
          "https://ableton.com"
          "https://alchemyrpg.com"
          "https://amazon.com"
          "https://blender.org"
          "https://codeberg.org"
          "https://framework.com"
          "https://gdquest.com"
          "https://github.com"
          "https://gitlab.com"
          "https://reddit.com"
          "https://tsuki.games"
          "https://twitch.tv"
          "https://udemy.com"
          "https://yagpdb.xyz"
          "https://youtube.com"
        ];
      };

      DisplayBookmarksToolbar = "never";

      ExtensionSettings = {

        "tridactyl.vim@cmcaine.co.uk" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tridactyl-vim/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };

        "firefox@betterttv.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/betterttv/latest.xpi";
          installation_mode = "force_installed";
        };

        "addon@darkreader.org" = {
          default_area = "navbar";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };

        # ublock origin
        "uBlock0@raymondhill.net" = {
          default_area = "navbar";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };

      Homepage = {
        # "URL" = "https://noai.duckduckgo.com"; # backup
        "URL" = "moz-extension://684c8205-dbcb-479c-adeb-8af56ee719a0/static/newtab.html";
        "StartPage" = "homepage";
      };

      NewTabPage = false;
      OverrideFirstRunPage = "https://noai.duckduckgo.com";

      # OverrideFirstRunPage = "https://noai.duckduckgo.com";

      # Permissions = {
      #   "Camera"= {
      #     "Allow"= ["https://example.org""https://example.org:1234"];
      #     "Block"= ["https://example.edu"];
      #     "BlockNewRequests"= true;
      #     "Locked"= true;
      #   };
      #   "Microphone"= {
      #     "Allow"= ["https://example.org"];
      #     "Block"= ["https://example.edu"];
      #     "BlockNewRequests"= true;
      #     "Locked"= true;
      #   };
      #   "Location"= {
      #     "Allow"= ["https://example.org"];
      #     "Block"= ["https://example.edu"];
      #     "BlockNewRequests"= true;
      #     "Locked"= true;
      #   };
      #   "Notifications"= {
      #     "Allow"= ["https://example.org"];
      #     "Block"= ["https://example.edu"];
      #     "BlockNewRequests"= true;
      #     "Locked"= true;
      #   };
      #   "Autoplay"= {
      #     "Allow"= ["https://example.org"];
      #     "Block"= ["https://example.edu"];
      #     "Default"= "allow-audio-video | block-audio | block-audio-video";
      #     "Locked"= true;
      #   };
      #   "VirtualReality"= {
      #     "Allow"= ["https://example.org"];
      #     "Block"= ["https://example.edu"];
      #     "BlockNewRequests"= true;
      #     "Locked"= true;
      #   };
      #   "ScreenShare"= {
      #     "Allow"= ["https://example.org"];
      #     "Block"= ["https://example.edu"];
      #     "BlockNewRequests"= true;
      #     "Locked"= true;
      #   };
      # };

      # PromptForDownloadLocation = true;
      # SanatizeOnShutdown = {
      #   "Cache" = true;
      #   "Cookies" = true;
      #   "FormData" = true;
      #   "History" = true;
      #   "Sessions" = true;
      #   "SiteSettings" = true;
      #   "Locked" = true;
      # } or true | false;

      SearchEngines = {
        "Add" = [
          {
            "Name" = "ddgno$";
            "URLTemplate" = "https://noai.duckduckgo.com/?q={searchTerms}";
            "Alias" = "@ddgno";
          }
        ];
        "Default" = "ddgno$";
      };

      # ROLL BACK TO 44 IF NEEDED
    };

    profiles.default = {
      settings = {
        "browser.display.screen_resolution" = 0;
        "browser.download.useDownloadDir" = false;
        "browser.low_commit_space_threshold_percent" = 100;
        "browser.tabs.loadOnNewTab" = 1;
        "browser.tabs.min_inactive_duration_before_unload" = 3600000;
        "browser.tabs.unloadOnLowMemory" = true;
        "customizableui.verticalTabs.defaultCollapsed" = true;
        "extenstions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "sidebar.verticalTabs" = true;
        "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
        "sidebar.visibility" = "hide";
        "ui.systemUsesDarkTheme" = 1;
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        # "webgl.disabled" = false;

        # required for sidebar collapse
        "gfx.webrender.all" = true;
        "gfxwebrenderenabled" = true;
        "layers.acceleration.force-enabled" = true;
        "layout.css.backdrop-filter.enabled" = true;
        "svg.context-properties.content.enabled" = true;
        "toolkit.legacyProfileCustomizations.stylesheets" = true;
        # "widget.gtk.ignore-bogus-leave-notify" = 1;
      };

      # userChrome = ''
      #   /* Decrease size of the sidebar header */
      #   #sidebar-header {
      #     font-size: 1.2em !important;
      #     padding: 2px 6px 2px 3px !important;
      #   }
      #   #sidebar-header #sidebar-close {
      #     padding: 3px !important;
      #   }
      #   #sidebar-header #sidebar-close .toolbarbutton-icon {
      #     width: 14px !important;
      #     height: 14px !important;
      #     opacity: 0.6 !important;
      #   }
      # '';

      userChrome = ''
        #sidebar {
          max-width: none !important
          min-width: 0px !important
        }
      '';

      # userChrome = ''
      #   #sidebar {
      #     max-width: none !important
      #     min-width: 0px !important
      #   }
      #   #sidebar-header {
      #     /* display: none; */
      #     visibility: collapse !important;
      #   }
      #   /* Hide splitter */
      #   # sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] + #sidebar-splitter {
      #     display: none !important;
      #   }
      #   /* Shrink sidebar until hovered */
      #   :root {
      #     --thin-tab-width: 30px;
      #     --wide-tab-width: 300px;
      #   }
      #   #sidebar-box:not([sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"]) {
      #     min-width: var(--wide-tab-width) !important;
      #     max-width: none !important;
      #   }
      #   #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] {
      #     overflow: hidden !important;
      #     position: relative !important;
      #     transition: all 300ms !important;
      #     /*transition: all 0ms 0s !important;*/
      #     min-width: var(--thin-tab-width) !important;
      #     max-width: var(--thin-tab-width) !important;
      #     z-index: 9999;
      #   }
      #   #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"]:hover,
      #   #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] #sidebar {
      #     /*transition-delay: 0s !important;*/
      #     transition: all 300ms !important;
      #     min-width: var(--wide-tab-width) !important;
      #     max-width: var(--wide-tab-width) !important;
      #     z-index: 9998;
      #     margin-right: calc((var(--wide-tab-width) - var(--thin-tab-width)) * -1) !important;
      #   }
      # '';

      # userChrome = ''
      #   #TabsToolbar {
      #   visibility: collapse;
      #   }

      #   #titlebar {
      #   display: none;
      #   }
      # '';

    };

    # OLD CONFIG
    # "new-tab-button"
    # "alltabs-button"
    # profiles.default.settings = {
    #   "widget.use-xdg-desktop-portal.file-picker" = 1;
    #   "browser.tabs.unloadOnLowMemory" = true;
    #   "browser.tabs.loadOnNewTab" = 1;
    #   "ui.systemUsesDarkTheme" = 1;
    #   # "browser.uiCustomization.navBarWhenVerticalTabs" =
    #   #   "[
    #   #   sidebar-button,
    #   #   stop-reload-button,
    #   #   home-button,
    #   #   customizableui-special-spring1,
    #   #   vertical-spacer,
    #   #   urlbar-container,
    #   #   customizableui-special-spring2,
    #   #   downloads-button,
    #   #   fxa-toolbar-menu-button,
    #   #   unified-extensions-button,
    #   #   addon_darkreader_org-browser-action,
    #   #   ublock0_raymondhill_net-browser-action
    #   #   ]";

    #   "extenstions.activeThemeID" = "firefox-compact-dark@mozilla.org";
    #   "sidebar.verticalTabs" = true;
    #   "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
    #   "browser.tabs.min_inactive_duration_before_unload" = 3600000;
    #   "browser.low_commit_space_threshold_percent" = 100;
    #   "browser.display.screen_resolution" = 0;
    #   "browser.download.useDownloadDir" = false;
    #   # "webgl.disabled" = false;
    # };

    # - [.] vifm-filechooser (WIP)
    # - [.] tridactyl settings?
    # - [X] remmebered sites
  };
}
