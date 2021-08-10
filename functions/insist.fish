set -l cmd (command basename (status -f) | cut -f 1 -d '.')
function $cmd -V cmd -d "Perform a command repetitively until successful"
  
  # Parse flags
  set -l failed
  if argparse -n $cmd 'h/help' 'q/quiet' 'c/continue' 'i/interval=' 'n/attempts=' -- $argv 2>&1 \
  | read err
    err $err
    set failed true
  end
  if string match -qvr '^\d+[smhd]?$' $_flag_interval
    err "$cmd: $_flag_interval: Invalid value"
    set failed true
  end
  if string match -qvr '^0*[1-9]\d*$' $_flag_attempts
    err "$cmd: $_flag_attempts: Invalid value"
    set failed true
  end
  if test "$failed"
    reg "Use |$cmd -h| to see examples of valid sintaxes"
    return 1
  end
  
  # Display help
  if set --query _flag_help
    source (command dirname (status -f ))/../instructions.fish
    not string length (set --names | string match -r '_flag_.+')$argv
    return $status
  end
  
  # If no command is passed, perform the last used comamnd.
  test "$argv"
  or set argv (string replace -r '^insist' '' $history[1])
  if test -z "$argv"
    err "$cmd: No command was passed and there's no history of previous commands"
    return 1
  end
  
  # Insist
  set -l count 0
  while true
    set count (math $count + 1)
  
    # Output, or not, the attempt count
    if not set --query _flag_quiet
      set --query _flag_attempts
      and wrn -o "Insisting... Attempt $count of $_flag_attempts"
      or wrn -o "Insisting... Attempt $count"
    end
  
    # Stop the function, or not, if the command was performed successfuly
    if eval $argv
      set --query _flag_continue
      or break
    end
  
    # Stop the function if it met a given limit of attempts
    test $count -eq "$_flag_attempts" 2>/dev/null
    and break
    set --query _flag_interval
    and command sleep $_flag_interval
    or command sleep 1  
  end
end
