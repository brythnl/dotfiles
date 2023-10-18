# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:$HOME/.config/composer/vendor/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$HOME/.config/composer/vendor/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# User specific aliases and functions

if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[\033[1;32m\]->  \[\033[1;96m\]\W\[\033[1;31m\]\$(parse_git_branch) \[\033[1;33m\]✗ \[\033[1;37m\]"

# aliases
alias config='/usr/bin/git --git-dir=/home/bryan/.dotfiles/ --work-tree=/home/bryan'
alias pycharm='/usr/bin/pycharm-community'
alias intj='/opt/idea-IU-232.9921.47/bin/idea.sh'
alias ob="tmux new -d '/opt/obsidian/Obsidian-1.4.16.AppImage'"
alias postman='/opt/Postman/Postman'
alias brave='brave-browser'
alias vim='nvim'
alias g='git'
alias easyroam='/usr/share/easyroam_connect_desktop/easyroam_connect_desktop'

# Load Angular CLI autocompletion.
source <(ng completion script)
