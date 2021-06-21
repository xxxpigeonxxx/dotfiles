# -------------
# Try to get close to normal colors in tmux
# -------------
set -g default-terminal "screen-256color"

# -------------
# start with window 1 (instead of 0)
# -------------
set -g base-index 1

# -------------
# start with pane 1
# -------------
set -g pane-base-index 1

# -------------
# status line
# -------------
set -g status-utf8 on
set -g status-justify left
set -g status-bg colour234
set -g status-fg white
set -g status-interval 4

# -------------
# window status
# -------------
setw -g window-status-format "#[fg=black]#[bg=colour7] #I #[fg=black]#[bg=colour15] #W "
setw -g window-status-current-format "#[fg=colour8]#[bg=white] #I #[bg=colour69]#[fg=white] #W "
setw -g window-status-current-bg black
setw -g window-status-current-fg yellow
setw -g window-status-current-attr bold
setw -g window-status-bg black
setw -g window-status-fg blue
setw -g window-status-attr default

# -------------
# Info on left (no session display)
# -------------
set -g status-left '#[fg=colour69]#S '
set -g status-right-length 150
set -g status-right "#{battery_icon} #[fg=colour69]#{battery_percentage} (#{battery_remain}) | #(ifconfig | egrep '192|10.12.12' | cut -d ' ' -f 2) | %H:%M "
