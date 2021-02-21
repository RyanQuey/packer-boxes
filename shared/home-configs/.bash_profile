

if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
else 
  [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

# so we start at home in WSL when using windows terminal
# - only do this when starting in windows terminal default, or else tmux always opens to home dir!

if [ $PWD = "/mnt/c/Users/queyr" ]; then
  cd ~
fi
