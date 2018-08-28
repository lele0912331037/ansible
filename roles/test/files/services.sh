#!/bin/sh

#echo `date` >>/tmp/jiagou.log
#echo $1 >> /tmp/jiagou.log

if [ $# -ne 2 ];then
    echo "usage: $0 server_name {help|start|stop|status|restart|update}"
    exit 1
fi

case "$1" in
    dialog-adapter | textual-asr )
        ;;
    *)
        echo "server name error : $1"
        echo "server name list : dialog-adapter textual-asr"
        exit 1
        ;;
esac

home=$(echo ~)
#IDC 11 12
SERVER=$home/online/$1
DIR=$home/online
SERVER_NAME=$1

start(){
    count=$(pgrep $SERVER_NAME | wc -l)
    if [ $count -ne 0 ];then
        echo "server already started!"
        exit 1
    fi

    cd $DIR
    if [ $? -ne 0 ];then
        echo "server dir not exist!"
        exit 1
    fi
    echo "start server:$SERVER..."
    #ulimit -c unlimited
    case "$1" in
    dialog-adapter)
	echo 1
        nohup ./$SERVER_NAME -dialog 10.101.3.19:9230 &> /dev/null &
        ;;
    textual-asr)
	echo 2
	export GIN_MODE=release
        nohup ./$SERVER_NAME -p 8080 -d 127.0.0.1:9934 &> /dev/null &
        ;;
    esac
    if [ $? -eq 0 ];then
        echo "start $SERVER success!"
    else
        echo "start $SERVER failed!"
    fi
}

stop(){
    count=$(pgrep $SERVER_NAME | wc -l)
    if [ $count -eq 0 ];then
        echo "server already stop!"
        exit 1
    fi

    echo "stop server:$SERVER..."
    PID=$(pgrep $SERVER_NAME)
    kill -9 $PID > /dev/null
    if [ $? -eq 0 ];then
        echo "stop $SERVER success!"
        return 0
    else
        echo "stop $SERVER failed!"
        return 1
    fi
}

restart(){
    if stop;then
        start "$1"
    fi
}

status(){
    ps -ef | grep "./$SERVER_NAME" | grep -v "grep"
    ss -lnp |grep "$(pgrep $SERVER_NAME)"
}

case "$2" in
    start)
        start "$1"
        ;;
    stop)
        stop
        ;;
    restart)
        restart "$1"
        ;;
    status)
        status
        ;;
    *)
        echo "usage: {start|stop|status|restart}"
        ;;
esac

exit 0