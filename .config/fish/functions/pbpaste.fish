if test (uname) = Linux
    function pbpaste --description "Paste data from the Clipboard"
        set -l wayland (echo $XDG_SESSION_TYPE)
        if test $wayland = wayland
            wl-paste
        else
            xsel --clipboard --output
        end
    end
end
