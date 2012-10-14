######################################################################
#
#  .zshenv file
#
#  initial setup file for both interactive and noninteractive zsh
#
#  ログインシェルとして使うときだけでなく,リモートシェル起動のときなど
#  すべての局面で有効とすべき設定を記述.
#
######################################################################

# Setup command search path
typeset -U path
# (N-/)を付けることで存在しなければ無視してくれる
path=(~/bin ~/local/bin /opt/local/bin(N-/) /opt/local/sbin(N-/) /usr/*/bin(N-/) /usr/local/*/bin(N-/) /var/lib/gems/*/bin(N-/) $path)

# リモートから起動するコマンド用の環境変数を設定
export RSYNC_RSH=ssh
export CVS_RSH=ssh

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
