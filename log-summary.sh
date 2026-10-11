#!/bin/bash
set -euo pipefail

#safety check 

#check if no. of files = 1

if [ "$#" -ne 1 ]; then
    echo "Usage: "$0" <logfile>" >&2
    exit 1
fi

#check if file actually exists

if [ ! -f "$1" ]; then
    echo "Error! "$1" is not a file or does not exist" >&2
    exit 1
fi

LOGFILE="$1"

TOTAL=$(wc -l < "$LOGFILE")

echo "Total lines: "$TOTAL""

GET_COUNT=$(grep -c '"GET ' "$LOGFILE" || true)

echo "GET requests: "$GET_COUNT""

POST_COUNT=$(grep -c '"POST ' "$LOGFILE" || true)

echo "POST requests: "$POST_COUNT""

COUNT_404=$(cut -d' ' -f9 "$LOGFILE" | grep -cx "404" || true)

echo "404 responses: $COUNT_404"

COUNT_500=$(cut -d' ' -f9 "$LOGFILE" | grep -cx "500" || true)

echo "500 responses: $COUNT_500"

UNIQ_IPS=$(cut -d' ' -f1 "$LOGFILE" | sort | uniq | wc -l)

echo "Unique IPs: "$UNIQ_IPS""