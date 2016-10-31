# Created by newuser for 5.1.1

# set -k
setopt interactivecomments

#export TERM="screen-256color-bce"
export TERM=xterm-256color

#[POWERLEVEL9K]
    #export DEFAULT_USER="ferenc"
    # For color codes check spectrum_ls:
    # https://github.com/dmmalam/dotty/blob/master/zsh/functions/spectrum_ls
    # For available segment colors
    # https://github.com/chris-murray/powerlevel9k-custom#special-segment-colors
    export POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="234"
    export POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="015"
    source ~/COMPILED/powerlevel9k/powerlevel9k.zsh-theme
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode context dir vcs)
#[/POWERLEVEL9K]

#[VI-Mode]
    ## general activation
    bindkey -v

    ## Usual history search
    bindkey '^R' history-incremental-search-backward
    bindkey '^P' history-beginning-search-backward
    bindkey '^N' history-beginning-search-forward

    ## Moving around like in bash
    bindkey '^H' backward-delete-char
    bindkey '^A' beginning-of-line
    bindkey '^E' end-of-line
    #bindkey "${terminfo[khome]}" beginning-of-line
    #bindkey "${terminfo[kend]}" end-of-line
    bindkey '^F' forward-char
    bindkey '^B' backward-char

    ## make it more responsive
    export KEYTIMEOUT=1
#[/VI-Mode]

#[Extra completions]
    autoload -U compinit && compinit

    ## homeshick
    source "$HOME/.homesick/repos/homeshick/homeshick.sh"
    export FPATH=$HOME/.homesick/repos/homeshick/completions:$FPATH
    autoload -U _homeshick
    compdef _homeshick homeshick

    ## mpv
    export FPATH=~/COMPILED/mpv/share/zsh/site-functions:$FPATH
    autoload -U _mpv
    compdef _mpv mpv
#[/Extra completions]

#[History settings]
    export HISTFILE=~/.zsh_history
    export HISTSIZE=50000
    export SAVEHIST=$HISTSIZE
    setopt EXTENDED_HISTORY
    setopt APPEND_HISTORY
    setopt HIST_NO_STORE
#[/History settings]

#[Zstyle settings]
    ## Enable Menu-Style Autocompletion
    ## navigate the suggestions using the arrow keys on the keyboard
    zstyle ':completion:*' menu select
#[/Zstyle settings]
