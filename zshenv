# common
export LANG=ja_JP.UTF-8

path=(
    $HOME/.local/bin
    $path
)


# applications
## golang
export GOBIN="$HOME/.local/bin"

## python
export PIPENV_VENV_IN_PROJECT=true
export PIPENV_CACHE_DIR=${XDG_RUNTIME_DIR:-/tmp}/pipenv-cache

# mpd
export MPD_HOST='/var/lib/mpd/socket'


# local settings
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
