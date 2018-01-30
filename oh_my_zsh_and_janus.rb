# rubocop:disable Metrics/LineLength
dep 'oh-my-zsh' do
  met? do
    '~/.oh-my-zsh/custom/shortcuts.zsh'.p.exists?
  end

  meet do
    log 'Initializing the submodule for .oh-my-zsh and .vim'
    shell 'cd ~/.dotfiles; git submodule init; git submodule update;'
    log_shell 'Symlinking shortcuts.zsh', 'ln -nsF /Users/`whoami`/.dotfiles/zsh_conf/custom/shortcuts.zsh /Users/`whoami`/.oh-my-zsh/custom/shortcuts.zsh'
    log_shell 'Symlinking zsh theme', 'ln -nsF /Users/`whoami`/.dotfiles/zsh_conf/jondkinney.zsh-theme /Users/`whoami`/.oh-my-zsh/themes/jondkinney.zsh-theme'
  end
end
# rubocop:enable Metrics/LineLength
