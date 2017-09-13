dep 'oh-my-zsh and janus' do
  met? {
    "~/.oh-my-zsh/custom/shortcuts.zsh".p.exists?
  }

  meet {
    log "Initializing the submodule for .oh-my-zsh and .vim"
    shell 'cd ~/.dotfiles; git submodule init; git submodule update;'
    log_shell "Symlinking shortcuts.zsh", "ln -nsF /Users/`whoami`/.dotfiles/zsh_conf/custom/shortcuts.zsh /Users/`whoami`/.oh-my-zsh/custom/shortcuts.zsh"
    log_shell "Symlinking zsh theme", "ln -nsF /Users/`whoami`/.dotfiles/zsh_conf/jondkinney.zsh-theme /Users/`whoami`/.oh-my-zsh/themes/jondkinney.zsh-theme"
    log_shell "Setting up Janus by running Rake", "cd ~/.vim;rake"
    log_shell "Symlinking mvim script to a folder in the path", "ln -nsF /Users/`whoami`/.dotfiles/vim_conf/mvim /usr/local/bin/mvim"
  }
end
