# rubocop:disable Metrics/LineLength
meta 'dotfiles' do
  accepts_value_for :repo, :basename
  accepts_value_for :target, :basename

  template do
    met? do
      "~/.#{target}".p.exists?
    end
    meet do
      log_shell 'Cloning', "git clone https://github.com/noahsettersten/#{repo}.git ~/.#{target}"
      log 'Symlinking'
      shellout = raw_shell("cd ~/.#{target} && chmod +x install.sh && sh install.sh").stdout
      log shellout.to_s
    end
  end
end
# rubocop:enable Metrics/LineLength

dep 'dotfiles', template: 'dotfiles'
dep 'private-dotfiles', template: 'dotfiles'
