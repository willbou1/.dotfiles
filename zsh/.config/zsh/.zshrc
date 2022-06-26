# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -n "$DISPLAY" ]  && command -v xdo >/dev/null 2>&1 && xdo id > /tmp/term-wid-"$$"
trap "( rm -f /tmp/term-wid-"$$" )" EXIT HUP

# Use pywal colors if in the herb wm

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle :compinstall filename '/home/william/.config/zsh/zshrc'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz compinit
compinit
# End of lines added by compinstall

# prompt customizations
PROMPT='%(?..%F{red}%? )%B%F{green}[%F{blue}%~%F{green}]%b '

source /usr/local/share/goto.sh

# user dirs aliases
alias v="vifmrun"
alias ge="cd ~/media/school/Édouard"
alias sv="sudoedit"
alias userctl='systemctl --user'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias g='goto'

alias kn="s kexec -l /boot/vmlinuz-linux --initrd=/boot/initramfs-linux.img --reuse-cmdline && s systemctl kexec"
alias kh="s kexec -l /boot/vmlinuz-linux-hardened --initrd=/boot/initramfs-linux-hardened.img --reuse-cmdline && s systemctl kexec"
alias kr="s kexec -l /boot/vmlinuz-linux-rt --initrd=/boot/initramfs-linux-rt.img --reuse-cmdline && s systemctl kexec"

# adding cross compiler to PATH
export PATH="$HOME/opt/cross/bin:$PATH"

case $TERM in
  (*xterm* | rxvt | alacritty)

    # Write some info to terminal title.
    # This is seen when the shell prompts for input.
    function precmd {
      print -Pn "\e]0;zsh%L %(1j,%j job%(2j|s|); ,)%~\a"
    }
    # Write command and args to terminal title.
    # This is seen while the shell waits for a command to complete.
    function preexec {
      printf "\033]0;%s\a" "$1"
    }

  ;;
esac

function mpvw() {
	killall picom
	killall xwinwrap
	mpv $1
	killall dbus-monitor
	nohup ~/.config/xwinwrap/repeat.sh ~/priv/vids/views/norway "0" > /dev/null 2>&1 &
	nohup picom --config ~/.config/picom/picom.conf > /dev/null 2>&1 &
}

# Exit code
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOCKER_CONTEXT_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_JOBS_SHOW=true
# Exec time
SPACESHIP_EXEC_TIME_SHOW=true
SPACESHIP_EXEC_TIME_PREFIX=""
SPACESHIP_EXEC_TIME_ELAPSED=1
# Git status
SPACESHIP_GIT_PREFIX=""
# Hostname
SPACESHIP_HOST_SHOW=true
SPACESHIP_HOST_PREFIX="@"
# Directory
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_TRUNC_PREFIX="…/"
# Username
SPACESHIP_USER_SUFFIX=""

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  gradle        # Gradle section
  maven         # Maven section
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  exit_code     # Exit code section
  jobs          # Background jobs indicator
  char          # Prompt character
)

autoload -U promptinit; promptinit
prompt spaceship

if ( ps aux | grep "herbstluftwm --locked" | grep -v grep ); then
	# ( ps aux | grep "Hyprland" | grep -v grep) ||
	# ( ps aux | grep "sway" | grep -v grep); then
	cat ~/.cache/wal/sequences
	clear
	neofetch
else
	clear
	neofetch | lolcat -a -s 1000 -d 8
fi
