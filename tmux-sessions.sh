#!/bin/bash
SESSION=poshc2

tmux -2 new -d -s $SESSION

# Setup a window for a PoshC2
tmux new-window -t $SESSION:1 -n 'poshc2'
tmux split-window -v
tmux select-pane -t 0
tmux send-keys "python C2Server.py" C-m
tmux select-pane -t 1
tmux send-keys "python ImplantHandler.py" C-m

# Set default window
tmux select-window -t $SESSION:1

# Attach to session
tmux -2 attach-session -t $SESSION