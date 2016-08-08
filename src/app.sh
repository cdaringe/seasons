# expose app constants and functions
export CMD1=${1:-}
export IS_VERBOSE=0
export IS_UNINSTALL=0
export IS_INSTALL=0

crash() {
  echo "[seasons] $1. exiting status code 1." 1>&2
  exit 1
}

log-verbose() {
  if [[ $IS_VERBOSE == 1 ]];
  then
    echo "[seasons] $1"
  fi
}
