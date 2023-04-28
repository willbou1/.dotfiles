function sudo -d "sudo wrapper that handles aliases"
    if functions -q -- $argv[1]
        set -l new_args (string join ' ' -- (string escape -- $argv))
        set argv fish -c "$new_args"
    end

    command sudo $argv
end

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='rg'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ip='ip --color=auto'

alias v="vifm"
alias sv="sudoedit"
alias uc='systemctl --user'
alias sc='sudo systemctl'
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias ll='lsd -laF'
alias lt='lsd --tree'
alias cat='bat'
alias y='ytfzf'
alias xt='extract'
alias fd='fd -H'
alias du='du -h'
alias free='free -h'
alias df='df -h'
alias p='procs'
alias c="clear"

if test $TERM = "xterm-kitty"
	alias icat="kitty +kitten icat"
	alias s="kitty +kitten ssh"
end

alias mutt="TERM=screen-256color neomutt"
alias ftp="lftp"
alias img="mpv --config-dir=$HOME/.config/mpv/mvi"
alias t="trash"
alias libreoffice="libreoffice --quickstart"
alias calcurse-caldav='CALCURSE_CALDAV_PASSWORD=$(gpg -dq "$XDG_CONFIG_HOME"/calcurse/caldav/password.gpg) calcurse-caldav'
alias vid='neovide --multigrid --nofork'
alias w='curl -s wttr.in | less -RS'
alias vpn='expressvpn'
alias virsh='virsh -c qemu:///system'
alias vs='virsh'

alias hc="herbstclient"
alias hlc="hyprctl"

alias s="sudo "

alias kn="s kexec -l /boot/vmlinuz-linux --initrd=/boot/initramfs-linux.img --reuse-cmdline && s systemctl kexec"
alias kh="s kexec -l /boot/vmlinuz-linux-hardened --initrd=/boot/initramfs-linux-hardened.img --reuse-cmdline && s systemctl kexec"
alias kr="s kexec -l /boot/vmlinuz-linux-rt --initrd=/boot/initramfs-linux-rt.img --reuse-cmdline && s systemctl kexec"
