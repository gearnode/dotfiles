IEx.configure(inspect: [limit: 7])
IEx.configure(default_prompt: "repl(%counter)>")
IEx.configure(history_size: 1000)
IEx.configure(width: 80)


debug = fn x ->
  IO.puts "# –––––––––––– DEBUG –––––––––––– #"
  IO.inspect x
  IO.puts "# –––––––––––– DEBUG –––––––––––– #"
end
