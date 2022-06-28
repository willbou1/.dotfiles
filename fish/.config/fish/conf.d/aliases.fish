alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ip='ip --color=auto'

alias v="vifmrun"
alias sv="sudoedit"
alias userctl='systemctl --user'
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias ll='lsd -laF'
alias lt='lsd --tree'
alias cat='bat'
alias g='goto'
alias y='ytfzf'
alias xt='extract'

alias mutt="neomutt"
alias ftp="lftp"
alias img="mpv --config-dir=$HOME/.config/mpv/mvi"
alias t="trash"
alias libreoffice="libreoffice --quickstart"
alias calcurse-caldav='CALCURSE_CALDAV_PASSWORD=$(gpg -dq "$XDG_CONFIG_HOME"/calcurse/caldav/password.gpg) calcurse-caldav'
alias vid='neovide --multigrid --nofork'
alias w='curl -s wttr.in | less -RS'

alias sudo="sudo"
alias s="sudo"

alias kn="s kexec -l /boot/vmlinuz-linux --initrd=/boot/initramfs-linux.img --reuse-cmdline && s systemctl kexec"
alias kh="s kexec -l /boot/vmlinuz-linux-hardened --initrd=/boot/initramfs-linux-hardened.img --reuse-cmdline && s systemctl kexec"
alias kr="s kexec -l /boot/vmlinuz-linux-rt --initrd=/boot/initramfs-linux-rt.img --reuse-cmdline && s systemctl kexec"
