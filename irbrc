if defined?(IRB)
  require 'irb/completion'
  require 'irb/ext/save-history'

  IRB.conf[:SAVE_HISTORY] = 1000
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
  IRB.conf[:PROMPT_MODE] = :SIMPLE
  IRB.conf[:AUTO_INDENT] = true
end

%w[json rubygems pp ostruct].each do |gem|
  begin
    require gem
  rescue LoadError
    puts "Failed to load #{gem} gem."
  end
end

File.exist?(__FILE__ + '/.extend-irbrc') && load(__FILE__ + '/.extend-irbrc')

OP = OpenStruct if defined?(OpenStruct)

def clear
  system('clear')
end
alias cl clear

alias q exit

ANSI_BOLD = "\033[1m".freeze
ANSI_RESET = "\033[0m".freeze
ANSI_LGRAY = "\033[0;37m".freeze
ANSI_GRAY = "\033[1;30m".freeze
ANSI_BLUE = "\033[1;33m".freeze
ANSI_RED = "\033[1;32m".freeze

# ruby documentation right on the console
# ie. ri Array#each
def ri(*names)
  args = names.map(&:to_s).join(' ')
  system("ri #{args}")
end

# Kernel Core Ext
#
# Add copy and past methods, wrapped pbcopy and pbpaste bin.
module Kernel
  def copy(str)
    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
    str
  end

  def paste
    `pbpaste`
  end
end
