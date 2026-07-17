function neo --description 'Dynamic dotfile editor shortcut'

    # Shortcuts
    set -l shortcuts (string join ", " \
      "-btop"\
      "-cava"\
      "-fastfetch"\
      "-fish"\
      "-hypr"\
      "-kitty"\
      "-nvim"\
      "-rofi"\
      "-swaync"\
      "-waybar"\
      "-waypaper"\
      "-yazi")

    # Trigger help display if no args or -h / --help is passed
    if test (count $argv) -eq 0; or test "$argv" = -h
        echo "Usage: neo [shortcut]"
        echo "Available shortcuts: $shortcuts"
        return 0
    end

    set -l config_dir ""

    # Switch case for all config_dir
    switch $argv

        # Btop
        case config.btop btop -btop
            set config_dir "~/.config/btop"

            # Cava
        case config.cava cava -cava
            set config_dir "~/.config/cava"

            # fastfetch
        case config.fastfetch fastfetch fetch -fastfetch -fetch
            set config_dir "~/.config/fastfetch"

        case config.fish fish -fish
            set config_dir "~/.config/fish"

        case config.hypr hypr -hypr
            set config_dir "~/.config/hypr"

        case config.kitty kitty -kitty
            set config_dir "~/.config/kitty"

        case config.nvim neovim nvim -neovim -nvim
            set config_dir "~/.config/nvim"

        case config.rofi rofi -rofi
            set config_dir "~/.config/rofi"

        case config.swaync swaync -swaync
            set config_dir "~/.config/swaync"

        case config.waybar waybar -waybar
            set config_dir "~/.config/waybar"

        case config.waypaper waypaper wpaper -waypaper -wpaper
            set config_dir "~/.config/waypaper"

        case config.yazi yazi -yazi
            set config_dir "~/.config/yazi"

        case '*'
            echo "Error: Unknown shortcut '$argv"
            echo "Available shortcuts: $shortcuts"
            return 1
    end

    eval nvim "$config_dir"
end
