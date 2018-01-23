#!/bin/bash
#exec 1> >(logger -s -t $(basename $0)) 2>&1

intern=eDP-1
extern=HDMI-2


function kill_poly()
{
  # Terminate already running bar instances
  killall  polybar

  # Wait until the processes have been shut down
  while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
}

function laptop()
{
  kill_poly
  xrandr --output "$extern" --off --output "$intern" --auto
  MONITOR=eDP-1 polybar top -c ~/.config/polybar/polybar_xrdb &
  #wal -t -i Pictures/Wallpapers
}


function dual()
{
  kill_poly
  xrandr --output "$intern" --primary --auto
  xrandr --output "$extern" --right-of "$intern" --auto
  MONITOR=eDP-1 polybar top -c ~/.config/polybar/polybar_xrdb &
  MONITOR=HDMI-2 polybar top -c ~/.config/polybar/polybar_xrdb &
  #wal -t -i Pictures/Wallpapers
  }

function external()
{
  kill_poly
  echo "lid closed, external detected"
  xrandr --output "$extern" --primary --auto
  xrandr --output "$intern" --off
  MONITOR=HDMI-2 polybar top -c ~/.config/polybar/polybar_xrdb &
  #wal -t -i Pictures/Wallpapers
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







