#! /bin/bash

curpath="`pwd`"
cd $curpath/../server/logs
logpath="`pwd`"
cd $logpath

declare -arr array
i=1

for a in `ls  search.log* | sort -g -r`
do
	num=`awk -F, '{print $5}' $a | grep userIP | sort -u | wc -l`
	ymdh=`echo $a | awk -F\. '{print $3}'`
  #day=`echo $ymdh | awk -F- '{print $4}'`
  #if [ $day == "00" ] ; then
  #  ymd=`echo $ymdh | awk 'BEGIN{FS="-"; OFS="-"} {print $1,$2,$3}'`
  #  ymdh="${ymd}-24"
  #fi

	if [ -z $ymdh ] ; then
		ymdh=`date +%Y-%m-%d-%H`
    result="$ymdh:$num"
    arr[0]="$result"
	else 
    result="$ymdh:$num"
    arr[$i]="$result"
  fi	
  
  i=`expr $i + 1`

done


for var in ${arr[@]}
do
echo $var
done


