#!/usr/bin/env ruby
Pry.config.tap do |c|
  c.color = true
  c.pager = false
  c.auto_indent = true
  c.correct_indent = true

  c.history.tap do |h|
    h.should_save = true
    h.should_load = true
    h.file = '~/.irb_history'
  end

  c.editor = "vim"
  c.should_load_plugins = false
  c.should_load_rc = true
  c.exception_whitelist = [SystemExit, SignalException]
  c.windows_console_warning = true
end

File.exist?("#{ENV['HOME']}/.irbrc") && load("#{ENV['HOME']}/.irbrc")
