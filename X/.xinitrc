exec i3 -V >> ~/i3log-$(date + '%F-%k-%M-%S') 2>&1

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
