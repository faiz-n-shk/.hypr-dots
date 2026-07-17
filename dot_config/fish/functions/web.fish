function web --description 'Shortcuts to web url links'

    # Shortcuts
    set -l shortcuts (string join ", " \
      "-archw"\
      "-hyprw"\
      "-waybarw"\
      "-git"\
      "-yt")

    # Trigger help display if no args or -h / --help is passed
    if test (count $argv) -eq 0; or test "$argv" = -h
        echo "Usage: neo [shortcut]"
        echo "Available shortcuts: $shortcuts"
        return 0
    end

    # Variable to hold our target URL
    set -l url ""

    # Check which shortcut user entered
    switch $argv
        case archwiki -archw
            set url "https://wiki.archlinux.org"

        case hyprlandwiki hyprwiki -hyprw
            set url "https://wiki.hypr.land"

        case waybarwiki wbwiki -waybarw -wbw
            set url "https://github.com/Alexays/Waybar/wiki"

        case github git -git -gh
            set url "https://github.com/faiz-n-shk"

        case youtube yt -yt
            set url "https://youtube.com"

        case '*'
            echo "Error: Unknown shortcut '$argv'"
            echo "Available shortcuts: archwiki, hyprwiki, waybarwiki, github, youtube"
            return 1
    end

    # Ensure browser is immune to terminal termination
    nohup xdg-open "$url" >/dev/null 2>&1 &
    disown

    # Buffer to open browser - Uncomment sleep and increase accordingly if browser is not opening 0.1 = 100ms
    # sleep 0.2

    # Kill the current kitty window
    kill -9 $fish_pid
end
