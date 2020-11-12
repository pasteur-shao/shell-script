#!/bin/bash

y=$(chage -l chatbot | grep "密碼過期" | awk {'print $3$4$5'} | grep -o '[[:digit:]]\+' | awk "NR==3");
m=$(chage -l chatbot | grep "密碼過期" | awk {'print $3$4$5'} | grep -o '[[:digit:]]\+' | awk "NR==1");
d=$(chage -l chatbot | grep "密碼過期" | awk {'print $3$4$5'} | grep -o '[[:digit:]]\+' | awk "NR==2");
duration=`echo $(($(date +%s -d "$y-$m-$d") - $(date +%s))) | awk '{t=split("60 s 60 m 24 h 999 d",a);for(n=1;n<t;n+=2){if($1==0)break;s=$1%a[n]a[n+1]s;$1=int($1/a[n])}print s}'`;

left_day=$(echo $duration | grep -o '[[:digit:]]\+' | awk "NR==1");
#left_hour=$(echo $duration | grep -o '[[:digit:]]\+' | awk "NR==2");
#left_min=$(echo $duration | grep -o '[[:digit:]]\+' | awk "NR==3");
#left_sec=$(echo $duration | grep -o '[[:digit:]]\+' | awk "NR==4");

echo $left_day;
