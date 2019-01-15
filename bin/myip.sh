#!/bin/sh

ping -c3 www.google.it 1>/dev/null 2>&1 && curl -s checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//' || echo "No connection"
