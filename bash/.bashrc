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

export PATH=$PATH:/usr/local/go/bin

. "$HOME/.cargo/env"

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# pnpm
export PNPM_HOME="/home/bryan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export NODE_OPTIONS="--max-old-space-size=8192"

# run tmux on start
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# aliases
alias intj='/opt/idea-IC-223.7571.182/bin/idea.sh'
alias ob="tmux new -d '/opt/obsidian/Obsidian-1.4.16.AppImage'"
alias postman="tmux new -d '/opt/Postman/Postman'"
alias brave='brave-browser'
alias vim='nvim'
alias g='git'
alias lg='lazygit'
alias easyroam='/usr/share/easyroam_connect_desktop/easyroam_connect_desktop'
alias secret='aws-vault exec bryan-joestin -- chamber'
alias start-mig-db='docker run -p 5432:5432 --rm -e POSTGRES_PASSWORD=postgres -e POSTGRES_USERNAME=postgres postgres'

okular() {
	if [ "$#" -eq 0 ]; then
		tmux new -d "okular"
	else
		tmux new -d "okular \"$@\""
	fi
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[\033[1;32m\]->  \[\033[1;96m\]\W\[\033[1;31m\]\$(parse_git_branch) \[\033[1;33m\]✗ \[\033[1;37m\]"

