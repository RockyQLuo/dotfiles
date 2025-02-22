#!/bin/bash
# 创建一个新的tmux会话，名称为my_session
tmux new-session -d -s service

# 切分窗口为左右两个
tmux split-window -h 

# 在每一个窗口中再次切分为上下两个
tmux select-pane -t 1 
tmux split-window -v 
tmux select-pane -t 3 
tmux split-window -v 

# 选择第一个窗口
tmux select-pane -t 0 
tmux send-keys -t 4 "zsh " Enter 
tmux send-keys -t 1 "zsh " Enter 
tmux send-keys -t 2 "zsh " Enter 
tmux send-keys -t 3 "zsh " Enter


# 附加到新创建的会话
tmux attach-session -t service

exit 0
