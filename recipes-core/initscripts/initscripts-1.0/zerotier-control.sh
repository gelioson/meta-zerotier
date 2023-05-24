#! /bin/sh

ZEROTIER_NETWORK_ID="_ZEROTIER_NETWORK_ID_" #ZEROTIER_NETWORK_ID must be specified in local.conf

case "$1" in
  start)
    if lsmod | grep -q tun ;
    then echo "mod tun ready" ;
    else
        /sbin/modprobe tun ;
        echo "modprobe tun started, zerotier-one should start in one minute";
        exit 0 ;
    fi
    if ( pidof zerotier-one )
    then echo "ZeroTier-One is already running."
    else
        echo "Starting ZeroTier-One" ;
        /usr/bin/zerotier-one -d ;
        echo "$(date) ZeroTier-One Started";
        exit 0 ;
    fi
    if /usr/bin/zerotier-one -q listnetworks | grep -q "$ZEROTIER_NETWORK_ID" ;
    then echo "Connected to Network" ;
    else
        /usr/bin/zerotier-one -q join $ZEROTIER_NETWORK_ID ;
        echo "Zetoried reqestedconnection to the Network. It must be approved in Zerotier Central";
    fi
    ;;
  stop)
    if ( pidof zerotier-one )
    then
        echo "Stopping ZeroTier-One";
        killall zerotier-one
        echo "$(date) ZeroTier-One Stopped" ;
    else
        echo "ZeroTier-One was not running" ;
    fi
    ;;
  status)
    if ( pidof zerotier-one )
    then echo "ZeroTier-One is running."
    else echo "ZeroTier-One is NOT running"
    fi
    ;;
  *)
    echo "Usage: zerotier-control {start|stop|status}"
    exit 1
    ;;
esac
exit 0
