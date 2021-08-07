set -l cmd (status filename | command xargs basename | cut -f 1 -d '.')
source (status filename | command xargs dirname)/../dependency.fish
complete -c $cmd -n 'not contains_opts' -s h -l help \
-d 'Display instructions'
complete -c $cmd -n 'not contains_opts h help' -s q -l quiet \
-d 'Suppress attempt count.'
complete -c $cmd -n 'not contains_opts h help' -s c -l continue \
-d "Continue to repeat the command even after it's successful."
complete -xc $cmd -n 'not contains_opts h help' -s i -l interval \
-d 'Set interval between attempts.'
complete -xc $cmd -n 'not contains_opts h help' -s n -l attempts \
-d 'Set a maximum number of repetitions.'
