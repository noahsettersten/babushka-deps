# Complete setup for my Macbook Pro, 'mbp17'
dep 'mbp17' do
  requires 'dotfiles',
           'private-dotfiles'

  requires 'os x prefs'

  requires 'brew packages'

  requires 'special'

  requires 'osx apps installed'

end

dep 'brew packages' do
  requires 'ack.managed',
           'git.managed',
           'growlnotify.managed',
           'imagemagick.managed',
           'redis',
           'sphinx.managed',
           'tig.managed',
           'tmux.managed',
           'tree.managed',
           'wget.managed'
end

dep 'special' do
  # Custom Installs (each maps to a file in this repo)
#  'coffeescript.src',
  requires 'HEXColorPicker',
           # 'macvim',
           'mysql.managed',
           #'npm',
           #'nvm',
           'oh-my-zsh and janus',
           'postgresql.managed',
           'Pow',
           'rvm'

  # System Level
  requires 'locatedb'
end


dep 'osx apps installed' do
  # Social, Web, Media etc.
  requires 'Evernote.app',
           'Google Chrome.app',
           'Skype.app',
           'VLC.app'

  # Development
  requires 'GitX.app',
           'iTerm.app',
           'MacVim.app',
           'Sequel Pro.app',
           'VirtualBox.installer'

  # System utilities
  requires 'CrashPlan.installer',
           'Cyberduck.app'

  # Tools
  requires '1Password.app',
           'Calico.app'
end
