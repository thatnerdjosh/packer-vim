#!/bin/sh

USER_ID=${HOST_USER_ID:-9001}
GROUP_ID=${HOST_GROUP_ID:-9001}
if [ ! -z "$USER_ID" ] && [ "$(id -u $WHO)" != "$USER_ID" ]; then
    groupadd --non-unique -g "$GROUP_ID" $WHO
    usermod --non-unique --uid "$USER_ID" --gid "$GROUP_ID" $WHO 
fi
exec /usr/local/bin/gosu $WHO tmux -u -2 "$@"
