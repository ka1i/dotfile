# Terminal Colors
# for code in {000..255}; do print -P -- "$code: %F{$code}Color%f"; done
autoload -Uz colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats \
    '%F{5}%F{5}[%F{2}%b%F{3}|%F{1}%a%c%u%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}%F{5}[%F{2}%b%c%u%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'

setopt no_nomatch

PS1="%{%F{255}%}%n%{%f%}@%{%F{039}%}%m%{%f%} %{%F{008}%}exec: %i/%h current: %j%{%f%} %{%F{093}%}status: %(?.%{%F{135}%}[ ok ]%{%f%}.%{%F{196}%}[oops]%{%f%})%{%f%}
%{%F{008}%}%y %1~%{%f%} %{%F{092}%}%#%{%f%}⚑ %{%F{141}%}<<<%{%f%} "

export HISTSIZE=20000000
export SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP 

# plugins
autoload -Uz compinit && compinit

source "/Users/mardan/config/zsh.config/git/git.plugin.zsh"
source "/Users/mardan/config/zsh.config/osx/osx.plugin.zsh"
source "/Users/mardan/config/zsh.config/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/Users/mardan/config/zsh.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# brew
export PATH="/usr/local/sbin:$PATH"

# Golang
export GO111MODULE=on
export GOROOT=/Users/mardan/Tools/Golang/go 
export GOPATH=/Users/mardan/Tools/Golang/res 
export PATH=${GOROOT}/bin:${GOPATH}/bin:${PATH}

# Qemu
export PATH=/Users/mardan/Tools/qemu-5.1.0/bin:${PATH}
# Qt5
export PATH="/usr/local/opt/qt/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/qt/lib"
export CPPFLAGS="-I/usr/local/opt/qt/include"
export PKG_CONFIG_PATH="/usr/local/opt/qt/lib/pkgconfig"

# Flutter
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PATH=/Users/mardan/Tools/flutter/bin:${PATH}

# Nodejs
export PATH=/Users/mardan/Tools/node-v14.15.3-darwin-x64/bin:${PATH}

# Maven
export PATH=/Users/mardan/Tools/Java/apache-maven-3.6.3/bin:${PATH}

# 3rd
export PATH=/Users/mardan/Tools/3rd/bin:${PATH}
export PATH=/Users/mardan/workspace/www.mardan.wiki/wispeeer/bin:${PATH}

alias subl='open -a "Sublime Text"'
alias neofetch='neofetch  --kernel_shorthand off --shell_path on  --refresh_rate on --disk_show "/" --disk_subtitle name --memory_percent on'
alias tree='tree -N'
alias git='LANG=en_US git'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mardan/Tools/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mardan/Tools/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mardan/Tools/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mardan/Tools/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

