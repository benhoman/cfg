if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Disable the fish greeting message
set fish_greeting ""

# Setup brew
eval "$(brew shellenv)"

# Pyenv setup
# Requires `brew install pyenv`
if type -q pyenv
  status --is-interactive; and source (pyenv init -|psub)
end

# Starship
function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience

source ~/.config/fish/abbreviations.fish
