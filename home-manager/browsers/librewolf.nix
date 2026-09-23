{ pkgs, ... }:
{
  programs.librewolf = {
    enable = true;

    languagePacks = [
      "es-ES"
      "en-GB"
      "jp"
    ];

    nativeMessagingHosts = with pkgs; [
      tridactyl-native
    ];

    # nativeMessagingHosts = [];

    profiles = {
      f8 = {
        id = 0;
        settings = {
          "browser.startup.homepage" = "https://noai.duckduckgo.com";
          "sidebar.verticalTabs" = true;
          "customizableui.verticalTabs.defaultCollapsed" = true;
          "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
          "browser.tabs.tabClipWidth" = 140;
          "browser.tabs.tabMinWidth" = 76;
          "devtools.toolbox.sidebar.width" = 50;
        };

      };

      f13 = {
        id = 1;
        settings = {
          "browser.startup.homepage" = "https://github.com";
          "sidebar.verticalTabs" = true;
        };
      };
    };

    policies = {
      Cookies = {
        "Allow" = [
          "http://ableton.com"
          "http://alchemyrpg.com"
          "http://amazon.com"
          "http://blender.org"
          "http://codeberg.org"
          "http://duckduckgo.org"
          "http://framework.com"
          "http://frame.work"
          "http://gdquest.com"
          "http://github.com"
          "http://gitlab.com"
          "http://pairdrop.net"
          "http://reddit.com"
          "http://tsuki.games"
          "http://twitch.tv"
          "http://udemy.com"
          "http://q2a.vifm.info"
          "http://yagpdb.xyz"
          "http://youtube.com"
          "https://ableton.com"
          "https://alchemyrpg.com"
          "https://amazon.com"
          "https://blender.org"
          "https://codeberg.org"
          "https://duckduckgo.org"
          "https://framework.com"
          "https://frame.work"
          "https://gdquest.com"
          "https://github.com"
          "https://gitlab.com"
          "https://pairdrop.net"
          "https://reddit.com"
          "https://tsuki.games"
          "https://twitch.tv"
          "https://udemy.com"
          "https://q2a.vifm.info"
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

        "default-compact-dark-theme@glitchii.github.io" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/default-compact-dark-theme/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };

        # "actual-default-dark-theme-goes-here" = {
        #   install_url =
        #   "https://addons.mozilla.org/en-US/firefox/addon/default-compact-dark-theme/";
        #   installation_mode = "";
        #   private_browsing = true;
        # };

      };
      # https://addons.mozilla.org/en-US/firefox/addon/default-compact-dark-theme/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search
      Homepage = {
        # "URL" = "https://noai.duckduckgo.com"; # backup
        "URL" = "moz-extension://ad75ce67-4ad4-4c05-bd9b-d1327dc7a168/static/newtab.html";
        # "URL" = "moz-extension://9b389777-2c23-4f20-9e1c-08c345924104/static/newtab.html";
        # "URL" = "moz-extension://684c8205-dbcb-479c-adeb-8af56ee719a0/static/newtab.html";
        "StartPage" = "previous-session";
      };

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
            "Name" = "ddgno";
            "URLTemplate" = "https://noai.duckduckgo.com/?q={searchTerms}";
            "Alias" = "@ddgno";
          }
          {
            "Name" = "nixpkgs";
            "URLTemplate" =
              "https://search.nixos.org/packages?include_modular_service_options=1&include_nixos_options=1&query={searchTerms}";
            "Alias" = "@nxp";
          }
          {
            "Name" = "nixoptions";
            "URLTemplate" =
              "https://search.nixos.org/options?include_modular_service_options=1&include_nixos_options=1&query={searhTerms}";
            "Alias" = "@nxo";
          }
          {
            "Name" = "nixwiki";
            "URLTemplate" = "https://nixos.wiki/index.php?search={searchTerms}";
            "Alias" = "@nwk";
          }
          {
            "Name" = "nixofficial";
            "URLTemplate" = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
            "Alias" = "@nw";
          }
          {
            "Name" = "home manager options";
            "URLTemplate" = "https://home-manager-options.extranix.com/?query={searchTerms}";
            "Alias" = "@hmo";
          }
          {
            "Name" = "my nixos";
            "URLTemplate" = "https://mynixos.com/search?q={searchTerms}";
            "Alias" = "@mnx";
          }
        ];
        "Default" = "ddgno";
      };

      # ROLL BACK TO 44 IF NEEDED
    };

    # "new-tab-button"
    # "alltabs-button"
    settings = {
      "widget.use-xdg-desktop-portal.file-picker" = 1;
      "browser.tabs.unloadOnLowMemory" = true;
      # "browser.uiCustomization.navBarWhenVerticalTabs" =
      #   "[
      #   unified-extensions-button,
      #   downloads-button,
      #   home-button,
      #   customizableui-special-spring1,
      #   vertical-spacer,
      #   urlbar-container,
      #   stop-reload-button,
      #   forward-button,
      #   back-button,
      #   customizableui-special-spring2,
      #   fxa-toolbar-menu-button,
      #   sidebar-button,
      #   addon_darkreader_org-browser-action,
      #   ublock0_raymondhill_net-browser-action
      #   ]";

      "extenstions.activeThemeID" = "firefox-compact-dark@mozilla.org";
      "sidebar.verticalTabs" = true;
      "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
      "browser.tabs.min_inactive_duration_before_unload" = 3600000;
      "browser.low_commit_space_threshold_percent" = 100;
      "browser.display.screen_resolution" = 0;
      "browser.download.useDownloadDir" = false;
      "browser.search.separatePrivateDefault" = false;
      # "webgl.disabled" = false;
    };

    # - [.] tridactyl settings?
    # - [X] remmebered sites
  };
}
