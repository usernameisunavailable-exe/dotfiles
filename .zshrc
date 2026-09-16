# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' format '<< %d >>'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/robifree/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

# --- THE GOOD STUFF ---

# Enable colors for ls
alias ls='ls --color=auto'

# Load autosuggestions (the faded "ghost" text for completions)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load syntax highlighting (MUST BE BEFORE STARSHIP AND AFTER EVERYTHING ELSE)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Initialize the Starship prompt
eval "$(starship init zsh)"
# automatically list choices on an ambiguous completion (like bash)
setopt BASH_AUTO_LIST

# don't save duplicate commands in history (better than bash)
setopt HIST_IGNORE_ALL_DUPS

# share history across all open terminal windows instantly
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# allow comments in the interactive shell (useful if you paste code with # in it)
setopt INTERACTIVE_COMMENTS
# fix the delete key
bindkey '^[[3~' delete-char

# fix ctrl + left/right arrows for jumping between words
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
# ------------------------
# USER CONFIG
# ------------------------
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PATH=$PATH:/home/robifree/.local/bin
alias "utils"="nvim ~/utilties.md"
alias "ppd"="powerprofilesctl"
alias "cls"="clear"
alias "unmap"="nmap -sn -n 192.168.0.0/24 -oG - | grep Up | awk '{print $2}' | sudo nmap -O -F -iL -"

