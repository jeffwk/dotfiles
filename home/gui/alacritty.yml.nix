{opacity, padding, decorations, fontFamily, fontStyle, fontSize, offset,
  ...}@options: {
    text = ''
# Configuration for Alacritty, the GPU enhanced terminal emulator.

env:
  # TERM: alacritty
  TERM: xterm-256color

window:
  opacity: ${opacity}

  # Allow terminal applications to change Alacritty's window title.
  dynamic_title: true

  # Window dimensions (changes require restart)
  #
  # Specified in number of columns/lines, not pixels.
  # If both are `0`, this setting is ignored.
  dimensions:
    columns: 0
    lines: 0

  padding:
    x: ${padding}
    y: ${padding}

  # Spread additional padding evenly around the terminal content.
  dynamic_padding: false

  # Values for `decorations`:
  #     - full: Borders and title bar
  #     - none: Neither borders nor title bar
  # Values for `decorations` (macOS only):
  #     - transparent: Title bar, transparent background and title bar buttons
  #     - buttonless: Title bar, transparent background, but no title bar buttons
  # decorations: none
  decorations: ${decorations}

  # Values for `startup_mode`:
  #   - Windowed
  #   - Maximized
  #   - Fullscreen
  # Values for `startup_mode` (macOS only):
  #   - SimpleFullscreen
  startup_mode: Windowed

  # Window class (Linux only):
  class: Alacritty

  gtk_theme_variant: Dark

scrolling:
  # Maximum number of lines in the scrollback buffer.
  # Specifying '0' will disable scrolling.
  history: 20000

  # Number of lines the viewport will move for every line scrolled when
  # scrollback is enabled (history > 0).
  multiplier: 4

  # Faux Scrolling
  #
  # The `faux_multiplier` setting controls the number of lines the terminal
  # should scroll when the alternate screen buffer is active. This is used
  # to allow mouse scrolling for applications like `man`.
  #
  # Specifying `0` will disable faux scrolling.
  # faux_multiplier: 3

# Font configuration (changes require restart)
font:
  normal:
    family: ${fontFamily}
    style: ${fontStyle}

  #bold:
  #  family: monospace

  #italic:
  #  family: monospace
  #  style: Italic

  size: ${fontSize}

  # Offset is the extra space around each character. `offset.y` can be thought of
  # as modifying the line spacing, and `offset.x` as modifying the letter spacing.
  offset:
    x: ${offset.x}
    y: ${offset.y}

  # Thin stroke font rendering (macOS only)
  use_thin_strokes: true

draw_bold_text_with_bright_colors: true

# Colors (one dark)
colors:
  # Default colors
  primary:
    background: '#1e2127'
    foreground: '#abb2bf'

    # Bright and dim foreground colors
    #
    # The dimmed foreground color is calculated automatically if it is not present.
    # If the bright foreground color is not set, or `draw_bold_text_with_bright_colors`
    # is `false`, the normal foreground color will be used.
    # dim_foreground: '#9a9a9a'
    bright_foreground: '#e6efff'

  # Cursor colors
  #
  # Colors which should be used to draw the terminal cursor. If these are unset,
  # the cursor color will be the inverse of the cell color.
  #cursor:
  #  text: '#000000'
  #  cursor: '#ffffff'

  # Normal colors
  normal:
    black:   '#1e2127'
    red:     '#fff000'
    green:   '#98c379'
    yellow:  '#d19a66'
    blue:    '#61afef'
    magenta: '#c678dd'
    cyan:    '#56b6c2'
    white:   '#e6efff'

# Colors (gruvbox)
# colors:
#   primary:
#     # background: "#2f2c28"
#     # background: "#262421"
#     background: "#201f1d"
#     foreground: "#ebdbb2"
#     # bright_foreground: '0xffffff'

#   cursor:
#     # background: '0x000000'
#     text: "#2a2826"
#     # foreground: '0xeaeaea'
#     cursor: "0xddcba4"

#   normal:
#     black: "0x242221"
#     red: "0xcc241d"
#     green: "0x98971a"
#     yellow: "0xd79921"
#     blue: "0x458588"
#     magenta: "0xb16286"
#     cyan: "0x689d6a"
#     white: "0xa89984"

#   bright:
#     black: "0x928374"
#     red: "0xfb4934"
#     green: "0xb8bb26"
#     yellow: "0xfabd2f"
#     blue: "0x83a598"
#     magenta: "0xd3869b"
#     cyan: "0x8ec07c"
#     white: "0xebdbb2"

# Visual Bell
#
# Any time the BEL code is received, Alacritty "rings" the visual bell. Once
# rung, the terminal background will be set to white and transition back to the
# default background color. You can control the rate of this transition by
# setting the `duration` property (represented in milliseconds). You can also
# configure the transition function by setting the `animation` property.
#
# Values for `animation`:
#   - Ease
#   - EaseOut
#   - EaseOutSine
#   - EaseOutQuad
#   - EaseOutCubic
#   - EaseOutQuart
#   - EaseOutQuint
#   - EaseOutExpo
#   - EaseOutCirc
#   - Linear
#
# Specifying a `duration` of `0` will disable the visual bell.
# visual_bell:
#   animation: EaseOutExpo
#   duration: 500
#   color: '0xffffff'

# Mouse bindings
#
# Available fields:
#   - mouse
#   - action
#   - mods (optional)
#
# Values for `mouse`:
#   - Middle
#   - Left
#   - Right
#   - Numeric identifier such as `5`
#
# All available `mods` and `action` values are documented in the key binding
# section.
mouse_bindings:
  - { mouse: Middle, action: PasteSelection }
  - { mouse: Middle, action: Copy, mods: Control }
  - { mouse: Middle, action: Paste, mods: Control|Shift }

mouse:
  # Click settings
  #
  # The `double_click` and `triple_click` settings control the time
  # alacritty should wait for accepting multiple clicks as one double
  # or triple click.
  double_click: { threshold: 300 }
  triple_click: { threshold: 300 }

  # If this is `true`, the cursor is temporarily hidden when typing.
  hide_when_typing: false

  #url:
    # URL launcher
    #
    # This program is executed when clicking on a text which is recognized as a URL.
    # The URL is always added to the command as the last parameter.
    #
    # When set to `None`, URL launching will be disabled completely.
    #
    # Default:
    #   - (macOS) open
    #   - (Linux) xdg-open
    #   - (Windows) explorer
    #  launcher:
    #  program: xdg-open
    #  args: []

    # URL modifiers
    #
    # These are the modifiers that need to be held down for opening URLs when clicking
    # on them. The available modifiers are documented in the key binding section.
    #modifiers: Control

selection:
  semantic_escape_chars: ',│`|:" ()[]{}<>'

  # When set to `true`, selected text will be copied to the primary clipboard.
  save_to_clipboard: false

cursor:
  # Cursor style
  #
  # Values for `style`:
  #   - ▇ Block
  #   - _ Underline
  #   - | Beam
  style: Block

  # If this is `true`, the cursor will be rendered as a hollow box when the
  # window is not focused.
  unfocused_hollow: true

  thickness: 0.175

# Live config reload (changes require restart)
live_config_reload: true

# Shell
#
# You can set `shell.program` to the path of your favorite shell, e.g. `/bin/fish`.
# Entries in `shell.args` are passed unmodified as arguments to the shell.
#
# Default:
#   - (macOS) /bin/bash --login
#   - (Linux) user login shell
#   - (Windows) powershell
#shell:
#  program: /bin/bash
#  args:
#    - --login

# Startup directory
#
# Directory the shell is started in. If this is unset, or `None`, the working
# directory of the parent process will be used.
working_directory: None

# Windows 10 ConPTY backend (Windows only)
#
# This will enable better color support and may resolve other issues,
# however this API and its implementation is still young and so is
# disabled by default, as stability may not be as good as the winpty
# backend.
#
# Alacritty will fall back to the WinPTY automatically if the ConPTY
# backend cannot be initialized.
enable_experimental_conpty_backend: false

# Send ESC (\x1b) before characters when alt is pressed.
alt_send_esc: true

debug:
  # Display the time it takes to redraw each frame.
  render_timer: false

  # Keep the log file after quitting Alacritty.
  persistent_logging: true

  # Log level
  #
  # Values for `log_level`:
  #   - None
  #   - Error
  #   - Warn
  #   - Info
  #   - Debug
  #   - Trace
  log_level: Warn

  # Print all received window events.
  print_events: false

  # Record all characters and escape sequences as test data.
  ref_test: false

# Key bindings
#
# Key bindings are specified as a list of objects. Each binding will specify a
# key and modifiers required to trigger it, terminal modes where the binding is
# applicable, and what should be done when the key binding fires. It can either
# send a byte sequence to the running application (`chars`), execute a
# predefined action (`action`) or fork and execute a specified command plus
# arguments (`command`).
#
# Bindings are always filled by default, but will be replaced when a new binding
# with the same triggers is defined. To unset a default binding, it can be
# mapped to the `None` action.
#
# Example:
#   `- { key: V, mods: Control|Shift, action: Paste }`
#
# Available fields:
#   - key
#   - mods (optional)
#   - chars | action | command (exactly one required)
#   - mode (optional)
#
# Values for `key`:
#   - `A` -> `Z`
#   - `F1` -> `F12`
#   - `Key1` -> `Key0`
#
#   A full list with available key codes can be found here:
#   https://docs.rs/glutin/*/glutin/enum.VirtualKeyCode.html#variants
#
#   Instead of using the name of the keys, the `key` field also supports using
#   the scancode of the desired key. Scancodes have to be specified as a
#   decimal number.
#   This command will allow you to display the hex scancodes for certain keys:
#     `showkey --scancodes`
#
# Values for `mods`:
#   - Command
#   - Control
#   - Option
#   - Super
#   - Shift
#   - Alt
#
#   Multiple `mods` can be combined using `|` like this: `mods: Control|Shift`.
#   Whitespace and capitalization is relevant and must match the example.
#
# Values for `chars`:
#   The `chars` field writes the specified string to the terminal. This makes
#   it possible to pass escape sequences.
#   To find escape codes for bindings like `PageUp` ("\x1b[5~"), you can run
#   the command `showkey -a` outside of tmux.
#   Note that applications use terminfo to map escape sequences back to
#   keys. It is therefore required to update the terminfo when
#   changing an escape sequence.
#
# Values for `action`:
#   - Paste
#   - PasteSelection
#   - Copy
#   - IncreaseFontSize
#   - DecreaseFontSize
#   - ResetFontSize
#   - ScrollPageUp
#   - ScrollPageDown
#   - ScrollLineUp
#   - ScrollLineDown
#   - ScrollToTop
#   - ScrollToBottom
#   - ClearHistory
#   - Hide
#   - Quit
#   - ClearLogNotice
#   - SpawnNewInstance
#   - ToggleFullscreen
#   - None
#
# Values for `action` (macOS only):
#   - ToggleSimpleFullscreen: Enters fullscreen without occupying another space
#
# Values for `command`:
#   The `command` field must be a map containing a `program` string and
#   an `args` array of command line parameter strings.
#
#   Example:
#       `command: { program: "alacritty", args: ["-e", "vttest"] }`
#
# Values for `mode`:
#   - ~AppCursor
#   - AppCursor
#   - ~AppKeypad
#   - AppKeypad
key_bindings:
  # (Windows/Linux only)
  - { key: V, mods: Control|Shift, action: Paste }
  - { key: C, mods: Control|Shift, action: Copy }
  - { key: V, mods: Control|Alt, action: PasteSelection }
  - { key: Key0, mods: Control, action: ResetFontSize }
  - { key: Equals, mods: Control, action: IncreaseFontSize }
  - { key: Plus, mods: Control, action: IncreaseFontSize }
  - { key: Minus, mods: Control, action: DecreaseFontSize }
  #- { key: Return,   mods: Alt,           action: ToggleFullscreen }

  # (macOS only)
  #- { key: Key0,   mods: Command,         action: ResetFontSize    }
  #- { key: Equals, mods: Command,         action: IncreaseFontSize }
  #- { key: Add,    mods: Command,         action: IncreaseFontSize }
  #- { key: Minus,  mods: Command,         action: DecreaseFontSize }
  #- { key: K,      mods: Command,         action: ClearHistory     }
  #- { key: K,      mods: Command,         chars: "\x0c"            }
  #- { key: V,      mods: Command,         action: Paste            }
  #- { key: C,      mods: Command,         action: Copy             }
  #- { key: H,      mods: Command,         action: Hide             }
  #- { key: Q,      mods: Command,         action: Quit             }
  #- { key: W,      mods: Command,         action: Quit             }
  #- { key: F,      mods: Command|Control, action: ToggleFullscreen }

  - { key: Paste, action: Paste }
  - { key: Copy, action: Copy }
  - { key: L, mods: Control, action: ClearLogNotice }
  - { key: L, mods: Control, chars: "\x0c" }
  - { key: Home, mods: Alt, chars: "\x1b[1;3H" }
  - { key: Home, chars: "\x1bOH", mode: AppCursor }
  - { key: Home, chars: "\x1b[H", mode: ~AppCursor }
  - { key: End, mods: Alt, chars: "\x1b[1;3F" }
  - { key: End, chars: "\x1bOF", mode: AppCursor }
  - { key: End, chars: "\x1b[F", mode: ~AppCursor }
  - { key: PageUp, mods: Shift, action: ScrollPageUp, mode: ~Alt }
  - { key: PageUp, mods: Shift, chars: "\x1b[5;2~", mode: Alt }
  - { key: PageUp, mods: Control, chars: "\x1b[5;5~" }
  - { key: PageUp, mods: Alt, chars: "\x1b[5;3~" }
  - { key: PageUp, chars: "\x1b[5~" }
  - { key: PageDown, mods: Shift, action: ScrollPageDown, mode: ~Alt }
  - { key: PageDown, mods: Shift, chars: "\x1b[6;2~", mode: Alt }
  - { key: PageDown, mods: Control, chars: "\x1b[6;5~" }
  - { key: PageDown, mods: Alt, chars: "\x1b[6;3~" }
  - { key: PageDown, chars: "\x1b[6~" }
  - { key: Tab, mods: Shift, chars: "\x1b[Z" }
  - { key: Back, chars: "\x7f" }
  - { key: Back, mods: Alt, chars: "\x1b\x7f" }
  - { key: Insert, chars: "\x1b[2~" }
  - { key: Delete, chars: "\x1b[3~" }
  - { key: Left, mods: Shift, chars: "\x1b[1;2D" }
  - { key: Left, mods: Control, chars: "\x1b[1;5D" }
  - { key: Left, mods: Alt, chars: "\x1b[1;3D" }
  - { key: Left, chars: "\x1b[D", mode: ~AppCursor }
  - { key: Left, chars: "\x1bOD", mode: AppCursor }
  - { key: Right, mods: Shift, chars: "\x1b[1;2C" }
  - { key: Right, mods: Control, chars: "\x1b[1;5C" }
  - { key: Right, mods: Alt, chars: "\x1b[1;3C" }
  - { key: Right, chars: "\x1b[C", mode: ~AppCursor }
  - { key: Right, chars: "\x1bOC", mode: AppCursor }
  - { key: Up, mods: Shift, chars: "\x1b[1;2A" }
  - { key: Up, mods: Control, chars: "\x1b[1;5A" }
  - { key: Up, mods: Alt, chars: "\x1b[1;3A" }
  - { key: Up, chars: "\x1b[A", mode: ~AppCursor }
  - { key: Up, chars: "\x1bOA", mode: AppCursor }
  - { key: Down, mods: Shift, chars: "\x1b[1;2B" }
  - { key: Down, mods: Control, chars: "\x1b[1;5B" }
  - { key: Down, mods: Alt, chars: "\x1b[1;3B" }
  - { key: Down, chars: "\x1b[B", mode: ~AppCursor }
  - { key: Down, chars: "\x1bOB", mode: AppCursor }
  - { key: F1, chars: "\x1bOP" }
  - { key: F2, chars: "\x1bOQ" }
  - { key: F3, chars: "\x1bOR" }
  - { key: F4, chars: "\x1bOS" }
  - { key: F5, chars: "\x1b[15~" }
  - { key: F6, chars: "\x1b[17~" }
  - { key: F7, chars: "\x1b[18~" }
  - { key: F8, chars: "\x1b[19~" }
  - { key: F9, chars: "\x1b[20~" }
  - { key: F10, chars: "\x1b[21~" }
  - { key: F11, chars: "\x1b[23~" }
  - { key: F12, chars: "\x1b[24~" }
  - { key: F1, mods: Shift, chars: "\x1b[1;2P" }
  - { key: F2, mods: Shift, chars: "\x1b[1;2Q" }
  - { key: F3, mods: Shift, chars: "\x1b[1;2R" }
  - { key: F4, mods: Shift, chars: "\x1b[1;2S" }
  - { key: F5, mods: Shift, chars: "\x1b[15;2~" }
  - { key: F6, mods: Shift, chars: "\x1b[17;2~" }
  - { key: F7, mods: Shift, chars: "\x1b[18;2~" }
  - { key: F8, mods: Shift, chars: "\x1b[19;2~" }
  - { key: F9, mods: Shift, chars: "\x1b[20;2~" }
  - { key: F10, mods: Shift, chars: "\x1b[21;2~" }
  - { key: F11, mods: Shift, chars: "\x1b[23;2~" }
  - { key: F12, mods: Shift, chars: "\x1b[24;2~" }
  - { key: F1, mods: Control, chars: "\x1b[1;5P" }
  - { key: F2, mods: Control, chars: "\x1b[1;5Q" }
  - { key: F3, mods: Control, chars: "\x1b[1;5R" }
  - { key: F4, mods: Control, chars: "\x1b[1;5S" }
  - { key: F5, mods: Control, chars: "\x1b[15;5~" }
  - { key: F6, mods: Control, chars: "\x1b[17;5~" }
  - { key: F7, mods: Control, chars: "\x1b[18;5~" }
  - { key: F8, mods: Control, chars: "\x1b[19;5~" }
  - { key: F9, mods: Control, chars: "\x1b[20;5~" }
  - { key: F10, mods: Control, chars: "\x1b[21;5~" }
  - { key: F11, mods: Control, chars: "\x1b[23;5~" }
  - { key: F12, mods: Control, chars: "\x1b[24;5~" }
  - { key: F1, mods: Alt, chars: "\x1b[1;6P" }
  - { key: F2, mods: Alt, chars: "\x1b[1;6Q" }
  - { key: F3, mods: Alt, chars: "\x1b[1;6R" }
  - { key: F4, mods: Alt, chars: "\x1b[1;6S" }
  - { key: F5, mods: Alt, chars: "\x1b[15;6~" }
  - { key: F6, mods: Alt, chars: "\x1b[17;6~" }
  - { key: F7, mods: Alt, chars: "\x1b[18;6~" }
  - { key: F8, mods: Alt, chars: "\x1b[19;6~" }
  - { key: F9, mods: Alt, chars: "\x1b[20;6~" }
  - { key: F10, mods: Alt, chars: "\x1b[21;6~" }
  - { key: F11, mods: Alt, chars: "\x1b[23;6~" }
  - { key: F12, mods: Alt, chars: "\x1b[24;6~" }
  - { key: F1, mods: Super, chars: "\x1b[1;3P" }
  - { key: F2, mods: Super, chars: "\x1b[1;3Q" }
  - { key: F3, mods: Super, chars: "\x1b[1;3R" }
  - { key: F4, mods: Super, chars: "\x1b[1;3S" }
  - { key: F5, mods: Super, chars: "\x1b[15;3~" }
  - { key: F6, mods: Super, chars: "\x1b[17;3~" }
  - { key: F7, mods: Super, chars: "\x1b[18;3~" }
  - { key: F8, mods: Super, chars: "\x1b[19;3~" }
  - { key: F9, mods: Super, chars: "\x1b[20;3~" }
  - { key: F10, mods: Super, chars: "\x1b[21;3~" }
  - { key: F11, mods: Super, chars: "\x1b[23;3~" }
  - { key: F12, mods: Super, chars: "\x1b[24;3~" }
  - { key: NumpadEnter, chars: "\n" }
  - { key: N, mods: Command, action: CreateNewWindow }
  - { key: N, mods: Command|Control, action: CreateNewWindow }
'';
}
