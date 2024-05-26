export PYENV_ROOT="$HOME/.cache/pyenv"
export PYENV_VIRTUALENV_ROOT="$PYENV_ROOT/plugins/pyenv-virtualenv"

# Bootstrap pyenv
if [ ! -d "$PYENV_ROOT" ]; then
  mkdir -p "$(dirname $PYENV_ROOT)"
  git clone --quiet https://github.com/pyenv/pyenv.git "$PYENV_ROOT"
fi

# Boostrap pyenv-virtualenv
if [ ! -d "$PYENV_VIRTUALENV_ROOT" ]; then
  mkdir -p "$(dirname $PYENV_VIRTUALENV_ROOT)"
  git clone --quiet https://github.com/pyenv/pyenv-virtualenv.git "$PYENV_VIRTUALENV_ROOT"
fi

[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
