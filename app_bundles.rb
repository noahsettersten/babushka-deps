# http://www.omnigroup.com/ftp1/pub/software/MacOSX/10.5/OmniGrafflePro-5.3.3.dmg
meta 'skip_eula_prompt' do
  accepts_value_for :app_name, :basename
  accepts_value_for :source, :source
  accepts_value_for :dmg_name

  template {
    met? {
      "/Applications/#{app_name}".p.exist? || "/Applications/#{dmg_name.gsub(/\.dmg/,'')}".p.exist?
    }
    meet {
      log "Using Babushka's Resource.get to snatch #{app_name}"
      Babushka::Resource.get("#{source}") do end
      log_shell "Stripping EULA","/usr/bin/hdiutil convert -quiet ~/.babushka/downloads/#{dmg_name} -format UDTO -o ~/.babushka/downloads/#{dmg_name.gsub(/\.dmg/,'')}"
      log_shell "Mounting and creating local folder with contents of DMG","/usr/bin/hdiutil attach -quiet -nobrowse -noverify -noautoopen -mountpoint ~/.babushka/downloads/#{dmg_name.gsub(/\.dmg/,'')} ~/.babushka/downloads/#{dmg_name.gsub(/\.dmg/,'')}.cdr"
      if "~/.babushka/downloads/#{dmg_name.gsub(/\.dmg/,'')}".include?("calico")
        log_shell "Making container folder for non-standard EULA app", "sudo mkdir -p /Applications/#{dmg_name.gsub(/\.dmg/,'')}"
        log_shell "Copying into /Applications","sudo cp -r ~/.babushka/downloads/#{dmg_name.gsub(/\.dmg/,'')}/* /Applications/#{dmg_name.gsub(/\.dmg/,'')}/", :spinner => true
      else
        log_shell "Copying into /Applications","sudo cp -r ~/.babushka/downloads/#{dmg_name.gsub(/\.dmg/,'')}/*.app /Applications", :spinner => true
      end

      after {
        log "Detaching DMG and deleting the .cdr we created"
        shell("/usr/bin/hdiutil detach ~/.babushka/downloads/#{dmg_name.gsub(/\.dmg/,'')}/")
        "~/.babushka/downloads/#{dmg_name.gsub(/\.dmg/,'')}.cdr".p.remove
      }
    }
  }
end

dep 'Calico.app', :template => 'skip_eula_prompt' do
  source 'http://www.kekus.com/downloads/calico_2_2.dmg'
  dmg_name 'calico_2_2.dmg'
end

dep 'Evernote.app', :template => 'skip_eula_prompt' do
  source 'http://evernote.s3.amazonaws.com/mac/release/Evernote_172019.dmg'
  dmg_name 'Evernote_172019.dmg'
end

# Normal Apps
# ----------------
dep 'GitX.app' do
  source 'http://frim.frim.nl/GitXStable.app.zip'
end

dep 'Sequel Pro.app' do
  source 'http://sequel-pro.googlecode.com/files/Sequel_Pro_0.9.9.1.dmg'
end

dep 'iTerm.app' do
  source 'http://iterm2.googlecode.com/files/iTerm2-beta2.zip'
end

dep 'Google Chrome.app' do
  source 'http://dl.google.com/chrome/mac/dev/GoogleChrome.dmg'
end

dep '1Password.app' do
  source 'http://aws.cachefly.net/dist/1P/mac/1Password-3.8.6.zip'
end

dep 'Skype.app' do
  source 'http://www.skype.com/go/getskype-macosx-samplingb'
end

dep 'VirtualBox.installer' do
  source 'http://download.virtualbox.org/virtualbox/4.1.2/VirtualBox-4.1.2-73507-OSX.dmg'
  met? { '/Applications/VirtualBox.app'.p.exists? }
end

dep 'CrashPlan.installer' do
  # requires 'JavaRuntime.installer' #NOTE: just let Lion prompt for the runtime env
  source 'http://download.crashplan.com/installs/mac/install/CrashPlan/CrashPlan_3.0.3_Mac.dmg'
  met? { "/Applications/CrashPlan.app".p.exists? }
end

dep 'Cyberduck.app' do
  source 'http://cyberduck.ch/Cyberduck-4.1.3.zip'
end

dep 'VLC.app' do
  source 'http://sourceforge.net/projects/vlc/files/1.1.11/macosx/vlc-1.1.11.dmg/download'
end

dep 'MacVim.app' do
  source 'https://github.com/downloads/b4winckler/macvim/MacVim-snapshot-62.tbz'
end
