muted=$(pactl list sinks | grep -A 10 RUNNING | grep Mute | grep -c yes)
string="/usr/share/icons/custom/white-sound-50.png"

if [[ $muted -eq 1 ]]; then
  string="/usr/share/icons/custom/white-mute-50.png"
fi

notify-send "sound" -i "$string"
