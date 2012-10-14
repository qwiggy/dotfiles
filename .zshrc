######################################################################
#
#  .zshrc file
#
#  initial setup file for only interactive zsh
#  This file is read after .zshenv file is read.
#
#  対話的にする場合にのみ必要な設定を記述.
#
######################################################################

###
# Set Shell variable
#

# history 環境設定
HISTFILE=~/.zsh_history HISTSIZE=100000 SAVEHIST=100000

# プロンプトの設定
autoload -U colors
colors
case ${UID} in
0) # root
  PROMPT="%{${fg[red]}%}%m%{${reset_color}%}%# "
  RPROMPT="[%~]"
  ;;
*)
  PROMPT="%{${fg[green]}%}%m%{${reset_color}%}%# "
  RPROMPT="[%~]"
  ;;
esac

# デフォルトパーミッションの設定
# 新規ファイルは644, 新規ディレクトリは755
umask 022

# LANG
export LANG=ja_JP.UTF-8

###
# Set shell options
#

# ディレクトリ名を入力するだけで移動する
setopt auto_cd

# cdコマンドでディレクトリスタックにカレントディレクトリがpushされる
# cd -[tab] でディレクトリスタック内の候補一覧を表示
setopt auto_pushd

# コマンド名のスペル訂正機能
setopt correct

# 補完候補を詰めて表示する
setopt list_packed

# 補完候補表示時にbeepを鳴らさない
setopt nolistbeep

# Ctrl-s, Ctrl-q を無効にする
setopt noflowcontrol

# 対話的なシェルでコメントを有効にする
setopt interactive_comments

# 同じコマンドは重複してヒストリに記録しない
setopt hist_ignore_dups

# スペースで始まる行はヒストリに記録しない
setopt hist_ignore_space

# コマンドの実行時間をヒストリに記録する
setopt extended_history

# コマンド実行時にすぐにヒストリファイルに書き出す
setopt inc_append_history

# 複数のzshセッションでヒストリをリアルタイムで共有する
setopt share_history

###
# Alias and functions
#
h () {history $* | less}
alias la='ls -a' ll='ls -la'
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  alias otp-md4="skey -md4"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac


#
# binding keys
#

# キーバインドはemacsモードにする
bindkey -e

###
# 補完機能
#

# 補完機能を有効にする
autoload -U compinit
compinit

###
# いろいろ
#

# ヒストリ検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# 内部コマンドのマニュアルも表示する
[ -n "`alias run-help`" ] && unalias run-help
autoload run-help

# ls color
unset LSCOLORS
case "${COLORTERM}" in
rxvt*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.pdf=00;32:*.ps=00;32:*.txt=00;32:*.patch=00;32:*.diff=00;32:*.log=00;32:*.tex=00;32:*.doc=00;32:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36'
  zstyle ':completion:*' list-colors \
    'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
