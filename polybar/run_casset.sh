#!/bin/sh

trap "/home/q/prog/casset/casset.py --toggle" USR1

while true; do
  /home/q/prog/casset/casset.py
  sleep 6000&
  wait
done
