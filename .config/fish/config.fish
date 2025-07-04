if status is-interactive
    set -gx EDITOR nvim

    fish_vi_key_bindings

    # Path
    set -x fish_user_paths
    fish_add_path ~/.local/bin

    # Disable the fish greeting message
    set fish_greeting ""

    # Plugin Config
    # Tide Prompt
    # tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time=No --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Sparse --icons='Few icons' --transient=Yes
    set --global tide_character_icon '🍆'
    set --global tide_cmd_duration_decimals 2
    set --global tide_cmd_duration_threshold 0

    # fzf.fish
    set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
end

# Setup brew
if type -q brew
    eval "$(brew shellenv)"
end

# Pyenv setup
# Requires `brew install pyenv`
if type -q pyenv
    if status is-interactive
        pyenv init - | source
        pyenv virtualenv-init - | source
    end
end

# Mise
if type -q mise
    if status is-interactive
        mise activate fish | source
    else
        mise activate fish --shims | source
    end
end

# # Atuin
# if type -q atuin
#     if status is-interactive
#         atuin init fish | source
#     end
# end

# # Starship
# function starship_transient_prompt_func
#   starship module character
# end
# starship init fish | source
# enable_transience

# Tide Prompt
# tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time=No --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Sparse --icons='Few icons' --transient=Yes
set --global tide_character_icon '🍆'
set --global tide_cmd_duration_decimals 2
set --global tide_cmd_duration_threshold 0

source ~/.config/fish/abbreviations.fish

# Bootstrap Fisher
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
