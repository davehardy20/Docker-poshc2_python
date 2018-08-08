#!/bin/bash

# Get the External IP of C2Server
echo Please Enter the External IP address or hostname of the C2Server
read EXTIPADDR
sed -i 's/HostnameIP = "https:\/\/172.16.0.126"/HostnameIP = "https:\/\/$EXTIPADDR"/g' /opt/PoshC2_Python/Config.py

SESSION=Red_Team
set mouse on
tmux -2 new -d -s $SESSION

# Setup a window for a PoshC2
tmux new-window -t $SESSION:1
tmux select-window -t $SESSION:1
tmux split-window -h
tmux select-pane -t 0
tmux send-keys "python C2Server.py" C-m
tmux select-pane -t 1
tmux send-keys "python ImplantHandler.py" C-m

# Set default window
tmux select-window -t $SESSION:1

# Attach to session
tmux -2 attach-session -t $SESSION