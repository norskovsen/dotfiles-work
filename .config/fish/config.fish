set -gx PATH $PATH /opt/gradle/bin
set -gx PATH $PATH ~/Diverse/

set -Ux EDITOR nvim

set fish_greeting
function fish_right_prompt
  #intentionally left blank
end

function sudo
    if test "$argv" = !!
    eval command sudo $history[1]
else
    command sudo $argv
    end
end

function ra
    set tmpfile "/tmp/pwd-from-ranger"
    ranger --choosedir=$tmpfile $argv
    set rangerpwd (cat $tmpfile)
    if test "$PWD" != $rangerpwd
        cd $rangerpwd
    end
end

alias ls "ls -B"
alias weather "curl wttr.in"
alias xclip "xclip -sel clip"
alias ipy "ipython3"
alias l "ls -lh"
alias vi "nvim"
alias zzz "systemctl suspend"
alias gimmeh "sudo apt install"
alias sl "ls"

alias icat 'kitty +kitten icat'

alias ccat='pygmentize -g'
alias http-server 'python3 -m http.server'
alias fix-caps 'xmodmap ~/.xmodmap'
alias fix-network 'systemctl restart network-manager'
alias plz 'sudo'
alias copy 'xclip -sel clip'
alias sound-reset 'killall volumeicon ; env Exec=env GTK_THEME=Arc:dark volumeicon & disown'
alias fix-padding 'bspc config top_padding 0'

# Notifications
alias do-not-disturb 'killall -SIGUSR1 dunst'
alias disable-do-not-disturb 'killall -SIGUSR2 dunst'
