def run_codeconnected_code(filename)
  # This is necessary to prevent terminal corruption when we send a ctrl-c to the terminal before execution
  `stty sane`
  # Print indicator so that app knows to turn echo back on
  puts 'START'
  load filename
  # Add an empty line after script output
  puts
  Pry.history.clear
end

def clear_history()
  Pry.history.clear
end

