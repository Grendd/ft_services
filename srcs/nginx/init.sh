#!/bin/sh

#nginx -g 'daemon off;'

ssh-keygen -A

/usr/bin/supervisord -c /etc/supervisord.conf