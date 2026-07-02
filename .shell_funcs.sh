function mandelbrot {
  local lines columns colour a b p q i pnew
  ((columns = COLUMNS - 1, lines = LINES - 1, colour = 0))
  for ((b = -1.5; b <= 1.5; b += 3.0 / lines)); do
    for ((a = -2.0; a <= 1; a += 3.0 / columns)); do
      for ((p = 0.0, q = 0.0, i = 0; p * p + q * q < 4 && i < 32; i++)); do
        ((pnew = p * p - q * q + a, q = 2 * p * q + b, p = pnew))
      done
      ((colour = (i / 4) % 8))
      echo -n "\\e[4${colour}m "
    done
    echo
  done
}

function po {
  popd $@
}

function pu {
  pushd $@
}

function echoerror { echo "$@" 1>&2; }

function path-add {
  case ":$PATH:" in
  *":$1:"*) : ;;        # already there
  *) PATH="$1:$PATH" ;; # or PATH="$PATH:$1"
  esac
}

function ix {
  local opts
  local OPTIND
  [ -f "$HOME/.netrc" ] && opts='-n'
  while getopts ":hd:i:n:" x; do
    case $x in
    h)
      echo "ix [-d ID] [-i ID] [-n N] [opts]"
      return
      ;;
    d)
      $echo curl $opts -X DELETE ix.io/$OPTARG
      return
      ;;
    i)
      opts="$opts -X PUT"
      local id="$OPTARG"
      ;;
    n) opts="$opts -F read:1=$OPTARG" ;;
    esac
  done
  shift $(($OPTIND - 1))
  [ -t 0 ] && {
    local filename="$1"
    shift
    [ "$filename" ] && {
      curl $opts -F f:1=@"$filename" $* ix.io/$id
      return
    }
    echo "^C to cancel, ^D to send."
  }
  curl $opts -F f:1='<-' $* ix.io/$id
}

function path {
  echo $PATH | tr ":" "\n" | nl
}

function find_here {
  fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
}

function kill_puma {
  ps -ef | grep puma | grep -v grep | awk '{ print $2 }' | xargs kill -9
}

function ddd_restart_dockers {
  . /Users/llopez/code/java/projects/ddd-fundamentals/docker/start-docker.sh
}

function start_proxy_staging {
  ssh -N -D 1080 proxy@k8s-proxy-staging-use1.aws.opploans.com -p 1080
}
function start_proxy_uat {

  ssh -N -D 1081 proxy@k8s-proxy-staging-use1.aws.opploans.com -p 1081
}

function start_proxy_preprod {

  ssh -N -D 1081 proxy@k8s-socks-proxy-staging-use1.aws.opploans.com -p 1081
}

function get_job_number() {
  local job=$1
}

monitor_and_restart() {
  local cmd=$1
  local log_file=$2

  $cmd >"$log_file" 2>&1 &
  tail -F "$log_file" | while read -r line; do
    if echo "$line" | grep -q -e "error Socket Closed"; then
      killProxy
      staging_proxy_full
    fi
  done
}

function start_tunnel_staging {
  export NODE_OPTIONS=--max-http-header-size=32768
  hpts -s 127.0.0.1:1080 -p 8080
}

function start_tunnel_uat {
  export NODE_OPTIONS=--max-http-header-size=32768
  hpts -s 127.0.0.1:1081 -p 8080
}

function uat_proxy_full {
  killProxy
  LOG_PATH=$HOME/logs
  start_proxy_uat &
  start_tunnel_uat &
}

function preprod_proxy_full {
  start_proxy_preprod &
  start_tunnel_staging &
}

function staging_proxy_full {
  killProxy
  LOG_PATH=$HOME/logs
  #monitor_and_restart start_proxy_staging $LOG_PATH/proxy_staging.log &
  start_proxy_staging &
  monitor_and_restart start_tunnel_staging $LOG_PATH/tunnel_staging.log &
}

function count_directories {
  find . -type f | wc -l
}

function isProxyRunning {
  IS_RUNNING=$(ps -ef | grep -v grep | grep "k8s-proxy-\|bin/hpts")
  [[ "$?" == "0" ]] && echo "Proxy: On" || echo "Proxy: Off"
}

function killProxy {
  PIDD=$(ps -ef | grep proxy@k8s-proxy | grep -v grep | awk '{ print $2 }' | head -n 1)
  if [[ -z "$PIDD" ]]; then
    echo "No proxy process found."
  else
    kill $PIDD
    echo "Killed proxy process with PID: $PIDD"
  fi
  TPID=$(ps -ef | grep -v grep | grep hpts | awk '{ print $2 }' | head -n 1)
  if [[ -z "$TPID" ]]; then
    echo "No tunnel process found."
  else
    kill $TPID
    echo "Killed tunnel process with PID: $TPID"
  fi
  killTunnelLog
}

function killTunnelLog {
  PIDD=$(ps -ef | grep staging.log | grep -v grep | awk '{ print $2 }' | head -n 1)
  if [[ -z "$PIDD" ]]; then
    echo "No tunnel log process found."
  else
    kill $PIDD
    echo "Killed tunnel log process with PID: $PIDD"
  fi
}

function cleApiTests_run {
  curl -o /dev/null -s -w "Total runtime: %{time_total}\n" --proxy "http://localhost:8080" --location 'http://cle-api-tests/api/v1/cle-api-test/run'
}

source ~/qa_tag_search.sh
