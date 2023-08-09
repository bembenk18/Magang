#!/bin/bash

URL="http://192.168.122.28/" 
REQUESTS=1000  # Jumlah permintaan yang ingin dilakukan
DELAY=0.5  # Penundaan dalam detik (500 ms)

for ((i=1; i<=$REQUESTS; i++)); do
    content=$(curl -s $URL)
    echo "Request $i:"
    echo "$content"
    echo "--------------------------"
    sleep $DELAY
done
