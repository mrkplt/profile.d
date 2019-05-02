load_conf() {
  local conf
  for conf in "$1"/*.conf; do
    [ -d "${conf}" ] && load_conf "${conf}"
    [ -f "${conf}" ] && source "${conf}"
  done
  return 0
}

conf_support() {
  cd `dirname ${BASH_ARGV[0]}`
  echo "`pwd`/$1"
  cd - > /dev/null
}

PROFILE_PATH="${HOME}/.profile.d"
PLATFORM=`uname`

load_conf "${PROFILE_PATH}"
load_conf "${PROFILE_PATH}/${PLATFORM}"

eval "$(direnv hook bash)"
