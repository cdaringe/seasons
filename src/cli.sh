function help()
{
  echo $':: seasons ::'
  echo 'generate daemons, without the hassle.'
  echo $'  -h --help, show help'
  echo $'  -i --install, installs daemon script'
  echo $'  -u --uninstall, uninstalls daemon script'
  echo $'  -v --verbose, toggle verbose mode on'
}

for KEY in "$@"; do
  case $KEY in
    -h | --help)
      help
      exit
      ;;
    -i | --install)
      IS_INSTALL=1
      ;;
    -u | --uninstall)
      IS_UNINSTALL=1
      ;;
    -v | --verbose)
      IS_VERBOSE=1
      ;;
    *)
      crash "unknown parameter \`$KEY\`. try \`--help\`"
      ;;
  esac
  shift
done

if [[ $IS_INSTALL == 1 ]]; then log-verbose "installing daemon"; fi
if [[ $IS_UNINSTALL == 1 ]]; then log-verbose "uninstalling daemon"; fi
