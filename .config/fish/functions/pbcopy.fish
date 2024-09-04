if test (uname) = Linux
    function pbcopy --description "Copy data from STDIN to the clipboard"
        set -l wayland (echo $XDG_SESSION_TYPE)
        if test $wayland = wayland
            # Wayland
            wl-copy
        else
            xsel --clipboard --input
        end
    end
end
