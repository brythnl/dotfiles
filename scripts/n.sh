#!/bin/bash

current_window=false

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -c|--current-window)
            current_window=true
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
    shift
done

if [ "$current_window" = true ]; then
    cd ~/notes && nvim
else
  tmux new-window -n "notes" -c "$HOME/notes" 'nvim'
fi
