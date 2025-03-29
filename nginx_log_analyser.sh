#!/bin/bash

echo "Top 5 IP addresses with the most requests:" && awk '{ips[$1]++} END {for (ip in ips) print ip " -", ips[ip] " requests"}' nginx-access.log | sort -k 3 -nr | head -n 5
echo
echo "Top 5 most requested paths:" && awk '{paths[$7]++} END {for (path in paths) print path " -", paths[path] " requests"}' nginx-access.log | sort -k 3 -nr | head -n 5
echo
echo "Top 5 response status codes:" && awk '{code=substr($6,2,length($6)-2); codes[code]++} END {for (code in codes) print code " -", codes[code] " requests"}' nginx-access.log | sort -k 3 -nr | head -n 5
