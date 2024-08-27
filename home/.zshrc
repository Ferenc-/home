#!/usr/bin/env bash
# Created by newuser for 5.1.1

# set -k
setopt interactivecomments


#[POWERLEVEL10K]
    # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
    # Initialization code that may require console input (password prompts, [y/n]
    # confirmations, etc.) must go above this block; everything else may go below.
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
    source ~/COMPILED/powerlevel10k/powerlevel10k.zsh-theme
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#[/POWERLEVEL10K]

#[ZSH-SYNTAX-HIGHLIGHT]
    source ~/COMPILED/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#[/ZSH-SYNTAX-HIGHLIGHT]

#[ZSH-VIMODE-VISUAL]
    source ~/COMPILED/zsh-vimode-visual/zsh-vimode-visual.zsh
#[/ZSH-VIMODE-VISUAL]

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

    ## Kubernetes kubectl completion only if it is installed and available
    ## https://vishh.github.io/docs/user-guide/kubectl/kubectl_completion/
    which kubectl >/dev/null 2>&1 && source <(kubectl completion zsh)

    ## Helm completion only if it is installed and available
    ## https://github.com/kubernetes/helm/blob/master/docs/helm/helm_completion.md
    which helm >/dev/null 2>&1 && source <(helm completion zsh)

    ## eksctl completion only if it is installed and available
    which eksctl >/dev/null 2>&1 && source <(eksctl completion zsh)

    ## aws completion only if it is installed and available
    if which aws_completer >/dev/null 2>&1; then
      autoload bashcompinit && bashcompinit
      complete -C 'aws_completer' aws
    fi

    ## Tekton CLI tkn
    which tkn >/dev/null 2>&1 && source <(tkn completion zsh)

#[/Extra completions]

#[History settings]
    export HISTFILE=~/.zsh_history
    export HISTSIZE=50000
    export SAVEHIST=$HISTSIZE
    setopt EXTENDED_HISTORY
    setopt APPEND_HISTORY
    setopt HIST_NO_STORE

    # Enable History Expansion on magic-space:
    # http://zsh.sourceforge.net/Doc/Release/Expansion.html#History-Expansion
    bindkey " " magic-space
#[/History settings]

#[Zstyle settings]
    ## Enable Menu-Style Autocompletion
    ## navigate the suggestions using the arrow keys on the keyboard
    zstyle ':completion:*' menu select
#[/Zstyle settings]

#[Binutil aliases]
    #[Colorized cat]
    alias ccat="pygmentize -O "style=emacs" -g"
    #[/Colorized cat]
    #[H]
        alias h='helm ls -a'
    #[H]
    #[J]
        alias j='jobs'
    #[/J]
    #[K]
        alias k='kubectl'
        compdef _kubectl k
    #[/K]
    #[L]
        alias l='ls -lah --color=always'
    #[/L]
    #[N]
        alias n='nvim'
    #[/N]
    #[Rg|Ag|Ack]
        alias rg='rg -n --heading --color=always --hidden --context 3 --smart-case'
    #[/Rg|Ag|Ack]
    #[Git]
        alias s='git status'
        alias d='git difftool'
        alias f='git difftool --cached'
    #[/Git]
    #[Tig]
        alias t='tig --all'
    #[/Tig]
#[/Binutil aliases]

# Turn off autocomplete beeps
unsetopt LIST_BEEP
# Turn off beeps on going beyond the history
unsetopt HIST_BEEP
# Turn off all beeps
unsetopt BEEP

