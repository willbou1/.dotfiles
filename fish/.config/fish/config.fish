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
	else if pgrep -f Hyprland > /dev/null
		command $argv &
		set PID (jobs -l | awk '{print $2}')
		while not hyprctl -j clients | jq -e ".[] | select(.pid == $PID)"
			sleep 0.1
		end
		hlc dispatch togglegroup none
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

# theme from terminal colors
set -U fish_color_autosuggestion      brblack
set -U fish_color_cancel              -r
set -U fish_color_command             brgreen
set -U fish_color_comment             brmagenta
set -U fish_color_cwd                 green
set -U fish_color_cwd_root            red
set -U fish_color_end                 brmagenta
set -U fish_color_error               brred
set -U fish_color_escape              brcyan
set -U fish_color_history_current     --bold
set -U fish_color_host                normal
set -U fish_color_match               --background=brblue
set -U fish_color_normal              normal
set -U fish_color_operator            cyan
set -U fish_color_param               brblue
set -U fish_color_quote               yellow
set -U fish_color_redirection         bryellow
set -U fish_color_search_match        'bryellow' '--background=brblack'
set -U fish_color_selection           'white' '--bold' '--background=brblack'
set -U fish_color_status              red
set -U fish_color_user                brgreen
set -U fish_color_valid_path          --underline
set -U fish_pager_color_completion    normal
set -U fish_pager_color_description   yellow
set -U fish_pager_color_prefix        'white' '--bold' '--underline'
set -U fish_pager_color_progress      'brwhite' '--background=cyan'

function fish_greeting
	set r (random 0 100)
	if pgrep -f herbstluftwm > /dev/null || pgrep -f Hyprland > /dev/null
		command cat ~/.cache/wal/sequences
	end
	if test $TERM = "xterm-kitty"; and test $r -ge 84
		neofetch --kitty $XDG_CONFIG_HOME/neofetch/image.png --size 548px --crop_offset north
	else if test $TERM = "xterm-kitty"; and test $r -ge 68
		neofetch --kitty $XDG_CONFIG_HOME/neofetch/image2.png --size 548px --crop_offset north
	else if test $TERM = "xterm-kitty"; and test $r -ge 50
		neofetch --kitty $XDG_CONFIG_HOME/neofetch/image3.png --size 548px --crop_offset north
	else
		neofetch
	end
end
alias clear="command clear; fish_greeting"

starship init fish | source
