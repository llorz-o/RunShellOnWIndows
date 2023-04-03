export LOG=~/utils.log
# $0 在脚本首是指 当前脚本相对于当前命令行所在目录的 相对路径文件
# dirname 是指脚本所在目录相对于当前命令行所在目录的 相对路径文件夹
# pwd 是当前命令行所在路径ss
shell_path() {
  terminal_pwd=$(pwd)
  cd "$terminal_pwd" || exit
  relative_shell_dir=$(dirname "$1")
  cd "$relative_shell_dir" || exit
  absolute_shell_dir=$(pwd)
  echo "$absolute_shell_dir"
}

err_catch() {
  if [ "$1" = "0" ]; then
    echo "$2 success"
  else
    time=$(date "+%Y%m%d-%H:%M:%S")
    echo "log file path is:$LOG"
    echo "!!! $time $2 !!!" >> "$LOG"
    echo -e "" >> "$LOG"
    echo "<$2> script error!!!"
    read -r
    exit
  fi
}

is_file() {
  if [ ! -f "$1" ]; then
    touch "$1"
  fi
}

is_dir() {
  if [ ! -d "$1" ]; then
    mkdir "$1"
  fi
}
