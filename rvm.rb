# rubocop:disable Metrics/LineLength
dep 'rvm' do
  met? do
    '~/.rvm/scripts/rvm'.p.file?
  end

  meet do
    shell 'bash -c "`curl https://rvm.beginrescueend.com/install/rvm`"'
    shell "echo \"
# RVM
[[ -s '/Users/`whoami`/.rvm/scripts/rvm' ]] && source '/Users/`whoami`/.rvm/scripts/rvm'\" >> /etc/bashrc
  source /etc/bashrc"
  end
end
# rubocop:enable Metrics/LineLength
