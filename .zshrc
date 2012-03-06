# colors
autoload -U colors
colors

# prompt
PROMPT="%{${fg[cyan]}%}[%n@%m %.]%(!.#.$) %{${reset_color}%}"

# vcs_info
autoload -Uz vcs_info
zstyle ':vsc_info:*' formats '(%s)-[%b]'
zstyle ':vsc_info:*' actionformats '(%s)-[%b|%a]'
precmd() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

# 補完機能
autoload -U compinit
compinit

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000 # ファイルサイズ
SAVEHIST=10000 # saveする量
setopt hist_ignore_dups # 重複を記録しない
setopt hist_reduce_blanks # スペース排除
setopt share_history # 履歴ファイルを共有
setopt EXTENDED_HISTORY # zshの開始終了を記録

# command aliases
alias ls="ls -F"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
