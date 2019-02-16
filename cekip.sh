#!/bin/bash
while read line; do
  ip="$(grep -oE '\([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$line")"
  echo "$ip" | tr -d "(" | sed  '/^$/d' >> cek;
done < $1


cat cek | sort -nr | uniq;

rm -rf cek;
