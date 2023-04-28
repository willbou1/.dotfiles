if pgrep -f herbstluftwm > /dev/null || pgrep -f Hyprland > /dev/null
    source ~/.cache/wal/colors.fish
end

set -gx SHELL /bin/fish

#Change layout to allow swallowing
function swallow
	alias hc=herbstclient
	alias hlc=hyprctl
	if pgrep -f herbstluftwm > /dev/null
		set HWM_LAYOUT (hc attr tags.focus.tiling.focused_frame.algorithm)
		set i 0	
		while test (hc attr tags.focus.tiling.focused_frame.client_count) != 1
			hc split explode
			set i (math $i + 1)
		end
		hc set_layout "max"
		command $argv
		for t in (seq 1 $i)
			hc remove
		end
		herbstclient set_layout $HWM_LAYOUT
        #	else if pgrep -f Hyprland > /dev/null
        #		command $argv &
        #		set PID (jobs -l | awk '{print $2}')
        #		while not hyprctl -j clients | jq -e ".[] | select(.pid == $PID)"
        #			sleep 0.1
        #		end
        #		hlc dispatch togglegroup none
	else
		command $argv
	end
end
alias mpv="swallow mpv"
alias feh="swallow feh"
alias zathura='zathura-pywal -a 0.75 && swallow zathura'
alias tuir='swallow tuir --enable-media'

command clear

fish_vi_key_bindings

set -gx GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

function fish_greeting
	set r (random 0 100)
		neofetch
end
alias clear="command clear; fish_greeting"

zoxide init fish | source

tty | grep tty > /dev/null && set -gx STARSHIP_CONFIG ~/.config/starship_tty.toml || set -gx STARSHIP_CONFIG ~/.config/starship.toml

starship init fish | source
