# Complete setup for Macbook Pro, 'mbp17'
dep 'mbp17' do
  requires 'dotfiles',
           'private-dotfiles',
           'os x prefs',
           'oh-my-zsh',
           'rvm'

  requires 'locatedb'

  # Social, Web, Media etc.
  requires 'Skype.app',
           'VLC.app'

  # Development
  requires 'GitX.app',
           'iTerm.app',
           'VirtualBox.installer'

  # System utilities
  requires 'CrashPlan.installer',
           'Cyberduck.app'

  # Tools
  requires '1Password.app'
end
