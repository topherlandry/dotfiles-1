#!/bin/bash
intern=eDP-1
extern=HDMI-2

if xrandr | grep "$extern disconnected"; then
  killall polybar 
  xrandr --output "$extern" --off --output "$intern" --auto
# bspc monitor eDP-1 -d I II III IV V VI VII VIII IX X
  ~/.fehbg 
#  MONITOR=eDP-1 polybar bottom -c ~/.config/polybar/space &
  MONITOR=eDP-1 polybar top -c ~/.config/polybar/space &
else
  killall polybar 
  xrandr --output "$intern" --primary --auto 
  xrandr --output "$extern" --left-of "$intern" --auto
#  bspc monitor eDP-1 -d VII VIII IX XI
#  bspc monitor HDMI-2 -d I II III IV V VI  
  ~/.fehbg
#  MONITOR=eDP-1 polybar bottom -c ~/.config/polybar/space &
  MONITOR=eDP-1 polybar top -c ~/.config/polybar/space &
  #MONITOR=HDMI-2 polybar top -c ~/.config/polybar/space &
#  MONITOR=HDMI-2 polybar bottom -c ~/.config/polybar/space &
fi
