# zsh settings
## key bind
bindkey -e
setopt no_flow_control

bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

## history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
HISTORY_IGNORE="(fg*|bg*|ls|la|ll|l|cd|vi|vim|exit)"
setopt hist_ignore_all_dups hist_save_no_dups hist_find_no_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt share_history inc_append_history
zstyle :compinstall filename "$HOME/.zshrc"

## completion
autoload -Uz compinit && compinit
zstyle ':completion:*' format '%B%F{blue}# %d%f%%b'
zstyle ':completion:*' group-name ''
setopt magic_equal_subst

## window title
chpwd() {
    print -nP "\e]2;%n@%m:%~\a"
}
chpwd

## etc
setopt extendedglob
setopt no_auto_remove_slash


# zsh styling
## left prompt
setopt prompt_subst

PROMPT='%F{green}%n@%m%f %F{blue}%c %#%f '
PS2='%F{245}...%f '

## right prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{3}+staged'
zstyle ':vcs_info:*' unstagedstr '%F{124}+unstaged'
zstyle ':vcs_info:*' formats '%F{245}%b%c%u%m%f'
zstyle ':vcs_info:*' actionformats '%K{240} %b %B%K{1} %a %k'

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
function +vi-git-untracked() {
    if [[ -n "$(git ls-files --others --exclude-standard)" ]]; then
        hook_com[misc]='%F{196}+untracked'
    fi
}

precmd() {
    if [[ -n "$RPROMPT" ]]; then
        vcs_info
    fi
}
RPROMPT='${vcs_info_msg_0_}'

## highlighting
if [[ -f /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
fi

## command coloring
export CLICOLOR=true

case $(uname) in
'Linux' )
    alias ls='ls -N --color=auto'
    alias l='ls -F'
    alias la='ls -aF'
    alias ll='ls -ahlF'
    ;;

'Darwin' )
    alias ls='ls -G'
    alias l='ls -F'
    alias la='ls -aF'
    alias ll='ls -ahlF'
    ;;
esac


# application settings
function flattenvim() {
    if [ "${VIM_INSTANCE_NAME}" != "" ]; then
        vim --servername ${VIM_INSTANCE_NAME} --remote $*
    else
        instance_name="$(head -c 12 /dev/random | base64)"
        VIM_INSTANCE_NAME="${instance_name}" vim --servername "${instance_name}" $*
    fi
}
alias vi=flattenvim
alias vim=flattenvim


# local settings
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
