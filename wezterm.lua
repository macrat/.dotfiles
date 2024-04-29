local wezterm = require 'wezterm'

return {
    font = wezterm.font_with_fallback{
        'HackGen Console',
        'Noto Sans Mono',
        'Noto Sans Mono CJK JP',
        'Noto Emoji',
    },
    font_size = 30.0,
    --use_ime = true,

    color_scheme = 'nord',
    window_padding = {
        left = 6,
        right = 6,
        top = 2,
        bottom = 2,
    },

    hide_tab_bar_if_only_one_tab = true,

    scrollback_lines = 10000,
}
