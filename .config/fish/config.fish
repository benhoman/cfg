if status is-interactive
  pyenv init - | source
  pyenv virtualenv-init - | source
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

# # Starship
# function starship_transient_prompt_func
#   starship module character
# end
# starship init fish | source
# enable_transience

# Tide Prompt
set --global tide_character_icon '🍆'
set --global tide_cmd_duration_decimals 2
set --global tide_cmd_duration_threshold 0

source ~/.config/fish/abbreviations.fish
