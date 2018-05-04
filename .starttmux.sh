#!/bin/sh
tmux -S /tmp/tmux-shared.sock new-session -d -s shared && chown :sshguest /tmp/tmux-shared.sock || :
tmux -S /tmp/tmux-shared.sock attach -t shared
