if test (fish --version | string match -ar '\d' | string join '') -lt 300
  set_color red
  echo '$package: This plugin is compatible with fish version 3.0.0 or above, please update before retrying to install it' 1>&2
  set_color normal
  exit 1
end
command wget -qO $path/dependency.fish \
https://gitlab.com/argonautica/dependency/raw/master/dependency.fish
source $path/dependency.fish -n $package
