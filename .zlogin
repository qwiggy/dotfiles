######################################################################
#
#  .zlogin file
#
#  Read in after the .zshrc file when you log in.
#  Not read in for subsequent shells. For setting up terminal and
#  global environment characteristics.
#
#  ログイン時にただ一度だけ行えばよい設定を記述.
#
######################################################################

# Global but interactive-use only variables
typeset -U manpath
manpath=(~/local/man /opt/local/man(N-/) /usr/*/man(N-/) /usr/local/*/man(N-/))
export MANPATH
export JLESSCHARSET=japanese

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
