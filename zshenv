# common

typeset -U path
path=(
    $HOME/.local/bin
    $path
)


# applications
## golang
export GOPATH="$HOME/.go"
export GOBIN="$HOME/.local/bin"

## python
export PIPENV_VENV_IN_PROJECT=true
export PIPENV_CACHE_DIR=${XDG_RUNTIME_DIR:-/tmp}/pipenv-cache

## editor
export EDITOR=nvim


# local settings
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
