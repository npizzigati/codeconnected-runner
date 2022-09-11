def run_codeconnected_code(filename)
  # This is necessary to prevent terminal corruption when we send a ctrl-c to the terminal before execution
  `stty sane`
  puts 'START'
  load filename
  puts
  Pry.history.clear
end

def clear_history()
  Pry.history.clear
end

