export LANG=ja_JP.UTF-8

alias ls='ls --color=auto'
if type eza &>/dev/null; then
  alias l='eza --icons'
  alias ls='eza --icons'
  alias la='eza --icons -a'
  alias ll='eza --icons -l'
  alias lt='eza --icons -T --git-ignore'
  alias llt='eza --icons -lT --git --git-ignore'
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  . $(brew --prefix asdf)/libexec/asdf.sh
fi

autoload -Uz compinit && compinit
autoload -Uz colors && colors

setopt auto_list
setopt auto_menu
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion::complete:*' use-cache true

setopt correct
setopt correct_all

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

if type starship &>/dev/null; then
  eval "$(starship init zsh)"
fi
