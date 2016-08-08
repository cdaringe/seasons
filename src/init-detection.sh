detect-init() {
  if [[ `systemctl` =~ -\.mount ]];
  then
    log-verbose "systemd detected"
    IS_SYSTEMD=1;
  elif [[ `/sbin/init --version` =~ upstart ]];
  then
    log-verbose "upstart detected"
    IS_UPSTART=1;
  elif [[ -f /etc/init.d/cron && ! -h /etc/init.d/cron ]];
  then
    log-verbose "systemv detected"
    IS_SYSTEMV=1;
  else
    crash "unsupported init system"
  fi
}
