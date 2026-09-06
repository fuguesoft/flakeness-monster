{ pkgs, ... }:
{
  # services.kmonad = {
  #   enable = false;
  #   # keyboards = {
  #   #   myk = {
  #   #     device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
  #   #     config = ''
  #   #       (defcfg
  #   #         ;; For Linux
  #   #         input  (device-file "/dev/input/by-path/platform-i8042-serio-0-event-kbd")
  #   #         output (uinput-sink "My KMonad output"
  #   #           ;; To understand the importance of the following line, see the section on
  #   #           ;; Compose-key sequences at the near-bottom of this file.
  #   #           "sleep 1 && setxkbmap -option compose:ralt")
  #   #         cmp-seq ralt    ;; Set the compose key to `RightAlt'
  #   #         cmp-seq-delay 5 ;; 5ms delay between each compose-key sequence press
  #   #         key-seq-delay 5 ;; 5ms delay between each outputted key event
  #   #
  #   #         ;; Comment this if you want unhandled events not to be emitted
  #   #         fallthrough true
  #   #
  #   #         ;; Set this to false to disable any command-execution in KMonad
  #   #         allow-cmd true
  #   #
  #   #         ;; Set the implicit around to `around`
  #   #         implicit-around around
  #   #       )
  #   #
  #   #       (defsrc
  #   #         grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
  #   #         tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
  #   #         caps a    s    d    f    g    h    j    k    l    ;    '    ret
  #   #         lsft z    x    c    v    b    n    m    ,    .    /    rsft
  #   #         lctl lmet lalt           spc            ralt rmet cmp  rctl
  #   #       )
  #   #
  #   #       (defalias
  #   #         cesc (tap-next-release esc lctl)
  #   #         grb #(t e x)
  #   #       )
  #   #
  #   #       (deflayer capsfix
  #   #         grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
  #   #         tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
  #   #         @cesc a    s    d    f    g    h    j    k    l    ;    '    ret
  #   #         @grb z    x    c    v    b    n    m    ,    .    /    rsft
  #   #         lctl lmet lalt           spc            ralt rmet cmp  rctl
  #   #       )
  #   #     '';
  #   #   };
  #   #
  #   # };
  # };
}
