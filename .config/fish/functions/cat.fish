function cat -d "Use bat instead of cat unless it's a Markdown file, then use mdless"
    set -l exts md markdown txt

    if not test -f $argv
        echo "File not found: $argv"
        return 0
    end

    if contains (get_ext $argv) $exts
        mdless $argv
    else
        if type -q bat
            command bat $argv
        else if type -q batcat
            command batcat $argv
        else
            command cat $argv
        end
    end
end
