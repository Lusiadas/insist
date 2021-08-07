set -l bld (set_color 00afff --bold);
set -l reg (set_color normal)
echo $bld"insist

""DESCRIPTION"$reg"

Repeat a command until it succeds. If no command is provided, perform the previous command.

"$bld"SYNTAX

"$bld"$cmd"$reg" [--quiet] [--continue] [--interval seconds] [--attempts number]

"$bld"OPTIONS

"$bld"-q/--quiet
Suppress attempt count.

"$bld"-c/--continue
Continue to repeat the command after it's successful.

"$bld"-i/--interval"$reg" [seconds]
Interval between attempts. It can be followed by a suffix: 's' for seconds (the default), 'm' for minutes, 'h' for hours and 'd' for days.

"$bld"-n/--attempts"$reg" [number]
Set a maximum number of repetitions.

"$bld"-h/--help"$reg"
Display these instructions.
" | less -R