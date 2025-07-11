# Pyenv setup
# Requires `brew install pyenv`
# Install pyenv update plugin: 
# git clone https://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update
if type -q pyenv
    if status is-interactive
        pyenv init - | source
        pyenv virtualenv-init - | source
    end
end
