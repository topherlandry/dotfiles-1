#!/bin/bash
intern=eDP-1
extern=HDMI-2


function laptop()
{
  killall polybar
  xrandr --output "$extern" --off --output "$intern" --auto
  MONITOR=eDP-1 polybar top -c ~/.config/polybar/polybar_xrdb &
  feh --bg-fill ./Pictures/Wallpapers/snow.jpg
}


function dual()
{
  killall polybar
  xrandr --output "$intern" --primary --auto
  xrandr --output "$extern" --left-of "$intern" --auto
  MONITOR=eDP-1 polybar top -c ~/.config/polybar/polybar_xrdb &
  MONITOR=HDMI-2 polybar top -c ~/.config/polybar/polybar_xrdb &
  feh --bg-fill ./Pictures/Wallpapers/snow.jpg
}

function external()
{
  killall polybar
  echo "lid closed, external detected"
  xrandr --output "$extern" --primary --auto
  xrandr --output "$intern" --off
  MONITOR=HDMI-2 polybar top -c ~/.config/polybar/polybar_xrdb &
  feh --bg-fill ./Pictures/Wallpapers/snow.jpg
}



if xrandr | grep "$extern disconnected"; then
  echo "external disconnected, running laptop()"
  laptop

elif grep "closed" /proc/acpi/button/lid/LID/state ; then
  echo "Lid closed, external assumed"
  external

else
  echo "configured external is not disconnected, and lid is open.  assuming both!"
  dual 
fi







