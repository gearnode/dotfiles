require 'rake'

desc "Install the dot files into user's home directory"
task :install do
  home_directory = ENV['HOME']

  set_zsh_by_default
  create_symbolic_links
end

def set_zsh_by_default
  system %Q{chsh -s `which zsh`}
end

def create_symbolic_links
  system( %Q{ln -s "$PWD/vimrc" "$HOME/.vimrc"} )
  system( %Q{ln -s "$PWD/zshrc" "$HOME/.zshrc"} )
end
