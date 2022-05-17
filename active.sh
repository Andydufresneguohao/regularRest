#!/bin/bash
alartTime=100
while (($alartTime))
do

if (($alartTime != 100)) # 如果不是 100，则说明不是初次运行，则弹出下面的提示
then
notify-send $alartTime"分钟已到，请重新设定！"
zenity --info --text "时间到，请重新设定！"
fi

alartTime=$(zenity --entry --title "rest定时提醒" --text "输入工作时间(分钟, 将忽略小数)")
alartTime=${alartTime%.*} # 忽略输入的小数点后面的数字，如 4.6 识别为 4

#如果alartTime不存在，则退出
if [ -z "$alartTime" ]
then
break
fi
notify-send "成功设定"$alartTime"分钟，开始计时"
sleep $((alartTime*60))

done
