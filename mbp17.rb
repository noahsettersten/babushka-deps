# Complete setup for my Macbook Pro, 'mbp17'
dep 'mbp17' do
  requires 'dotfiles',
           'private-dotfiles'

  requires 'os x prefs'

  requires 'special'

  requires 'osx apps installed'

end

dep 'special' do
  # Custom Installs (each maps to a file in this repo)
  requires 'oh-my-zsh',
           'rvm'

  # System Level
  requires 'locatedb'
end


dep 'osx apps installed' do
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
