#!/bin/bash

seq=1

#while (true)
for i in {1..40}
do
  if [ $seq -eq 8 ]; then
    seq=1
  else
    seq=$((seq+1))
  fi

  tput cup $(tput lines) 0
  printf "\xF0\x9F\x8C\x9"$seq
  sleep 0.1
    
done


echo



