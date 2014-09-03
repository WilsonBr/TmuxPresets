#!/bin/bash
SESSION="$1"
WORK_DIR="~/scratch/work/$1"
RUBY_VERSION='1.9.3'

tmux -2 new-session -d -s $SESSION

tmux rename-window 'console'
tmux send-keys "cd $WORK_DIR" C-m
tmux send-keys "source ~/.bashrc" C-m
tmux send-keys "source ./config/deploy.sh" C-m

tmux new-window -t $SESSION:1 -n 'server'
tmux select-window -t $SESSION:1
tmux send-keys "cd $WORK_DIR" C-m
tmux send-keys "source ~/.bashrc" C-m
tmux send-keys "source ./config/deploy.sh" C-m
tmux send-keys "rails s" C-m

tmux new-window -t $SESSION:2 -n 'vim'
tmux select-window -t $SESSION:2
tmux send-keys "cd $WORK_DIR" C-m
tmux send-keys "source ~/.bashrc" C-m
tmux send-keys "vim" C-m
tmux -2 attach-session -t $SESSION

