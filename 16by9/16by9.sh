#!/bin/bash
#
#			Script um die Auflösung des Virtual0 Display
#			auf 1920 x 1080 [16:9] zu ändern
#
#			Auflösung kann in den Variablen:
#
#				[res_x] und [res_y]
#
#			geändert werden. Script wurde nur in Debian
#			Kali-VM getestet:
#
#			Linux kali 6.6.15-amd64 #1 SMP PREEMPT_DYNAMIC Kali 6.6.15-2kali1 (2024-04-09) x86_64 GNU/Linux
#
#			@author=Timo Baginski
#			@version 1.0
#
#			Works like a charme. 




#Auflösung definieren [X] x [Y]
res_x=1920
res_y=1080

# Benutzerdefinierte Auflösung mit cvt erstellen und Informationen speichern
mode_info=$(cvt $res_x $res_y | grep "Modeline")
mode_name=$(echo "$mode_info" | cut -d' ' -f2)
mode_values=$(echo "$mode_info" | cut -d' ' -f4-)

# Neue Auflösung mit xrandr
xrandr --newmode $mode_name $mode_values

# Neue Auflösung dem Mode
xrandr --addmode Virtual1 $mode_name

# Auflösung auf die Auflösung setzen
xrandr --output Virtual1 --mode $mode_name
