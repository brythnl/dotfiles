# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# go
export PATH=$PATH:/usr/local/go/bin
GOPATH="$HOME/dev/go"
export PATH="$GOPATH/bin:$PATH"
# rust
. "$HOME/.cargo/env"
# java
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NODE_OPTIONS="--max-old-space-size=8192"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
# pnpm
export PNPM_HOME="/home/bryan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

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
## apps
alias ob="tmux new -d '/opt/obsidian/Obsidian-1.4.16.AppImage'"
alias postman="tmux new -d '/opt/Postman/Postman'"
alias brave='brave-browser'
alias vim='nvim'
alias g='git'
alias lg='lazygit'
alias easyroam='/usr/share/easyroam_connect_desktop/easyroam_connect_desktop'
## sidestream
alias ss='/home/bryan/dev/scripts/sidestream-dev.sh'
alias hans='cd /home/bryan/dev/sidestream/hanselmann-os && vim'
alias secret='aws-vault exec bryan-joestin -- chamber'
alias start-mig-db='docker run -p 5432:5432 --rm -e POSTGRES_PASSWORD=postgres -e POSTGRES_USERNAME=postgres postgres'
## pnpm
alias p='pnpm'
alias typc='pnpm typecheck'
alias stu='pnpm prisma studio'
alias dbp='pnpm prisma db push'
alias lfx='pnpm lint --fix'
alias dev='pnpm dev'
## misc
alias cat='bat'
alias kills='tmux kill-session'
alias cl='clear'
alias dotvim='vim /home/bryan/dev/dotfiles/nvim'
alias dotbash='vim /home/bryan/dev/dotfiles/bash/.bashrc'

# run okular in the background
okular() {
	if [ "$#" -eq 0 ]; then
		tmux new -d "okular"
	else
		tmux new -d "okular \"$@\""
	fi
}
# show git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[\033[1;32m\]->  \[\033[1;96m\]\W\[\033[1;31m\]\$(parse_git_branch) \[\033[1;33m\]✗ \[\033[1;37m\]"


# pnpm
export PNPM_HOME="/home/bryan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
