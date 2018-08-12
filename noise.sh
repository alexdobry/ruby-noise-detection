#!/bin/sh

case "$1" in
    start)
        echo "Starting Noise Detection"
        sudo kill -9 `pgrep -f noise_detection` >/dev/null 2>&1
        sudo /home/pi/ruby-noise-detection/noise_detection.rb -m 1 -n 0.1 >/dev/null 2>&1
    return $? ;;
    stop)
        sudo kill -9 `pgrep -f noise_detection` >/dev/null 2>&1
        sudo rm /home/pi/ruby-noise-detection/noise.wav
    return $? ;;
    *)
    echo "Usage: noise {start|stop}"
    return 1 ;;
esac
