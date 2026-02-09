#!/bin/bash

new_window=false

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -c|--new-window)
            new_window=true
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
    shift
done

if [ "$new_window" = true ]; then
    tmux new-window -n "notes" -c "$HOME/notes" 'nvim'
else
    tmux rename-window "notes" && cd ~/notes && nvim
fi
