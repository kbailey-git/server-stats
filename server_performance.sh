echo
top -bn1 | grep %Cpu | awk -F ',' '{sub(/id/,"")}{printf "CPU Usage: %.2f%%\n",100-$4}'
echo
free | awk '/^Mem/ {printf"Memory usage: %.2f\tUsed: %d\t Free: %d\n",$3/$4 * 100,$3,$4}'
echo
df -x overlay | awk 'NR>1 {used+=$3;}{free+=$4;} END{printf "Disk Usage:%.2f%%\tDisk Used: %d\tDisk Free: %d\n",used/free*100,used,free}'
echo
echo "Top 5 Processes by Mem"
echo
ps aux --sort -%mem | awk '{print $1,$2,$3,$11}' | head -6
echo
echo "Top 5 Processes by CPU"
echo
ps aux --sort -%cpu | awk '{print $1,$2,$4,$11}' | head -6
echo