# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# List tasks on startup
# td ls

# go
export PATH=$PATH:/usr/local/go/bin
GOPATH="$HOME/dev/go"
export PATH="$GOPATH/bin:$PATH"
# rust
. "$HOME/.cargo/env"
# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NODE_OPTIONS="--max-old-space-size=8192"
# deno
. "/home/bryan/.deno/env"
# pnpm
export PNPM_HOME="/home/bryan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# ALIASES
## apps || tools
alias idea="tmux new -d '/opt/idea-IU-251.26094.121/bin/idea'"
alias ob="tmux new -d '/opt/obsidian/Obsidian-1.8.7.AppImage'"
alias postman="tmux new -d '/opt/Postman/Postman'"
alias brave='brave-browser'
alias t='tmux'
alias vim='nvim'
alias g='git'
alias lg='lazygit'
alias easyroam='/usr/share/easyroam_connect_desktop/easyroam_connect_desktop'
## sidestream
alias ss='/home/bryan/dev/sidestream/setup-dev.sh'
alias hos='cd /home/bryan/dev/sidestream/hanselmann-os && vim'
alias secret='aws-vault exec bryan-joestin -- chamber'
alias mcp='cp prisma/schema.prisma prisma/schema_old.prisma'
alias mdiff='pnpm prisma migrate diff --from-schema-datamodel prisma/schema_old.prisma --to-schema-datamodel prisma/schema.prisma --script'
alias localeflat='flat i18n/locales/de.json > tmp_de.json && flat i18n/locales/en.json > tmp_en.json && mv tmp_de.json i18n/locales/de.json && mv tmp_en.json i18n/locales/en.json'
alias db='sudo -u postgres psql' # Why do localhost need to be specified: https://stackoverflow.com/questions/7369164/postgresql-why-do-i-have-to-specify-h-localhost-when-running-psql
alias tstart='export $(grep -v '^#' .env | xargs) && pnpm start &'
## pnpm
alias p='pnpm'
alias typc='pnpm typecheck'
alias stu='pnpm prisma studio'
alias dbp='pnpm prisma db push'
alias lfx='pnpm lint --fix && p localesort'
alias dev='pnpm dev'
## go
alias gt='go test'
## misc
alias cat='bat'
alias kills='tmux kill-session'
alias cl='clear'
alias dotvim='vim /home/bryan/dev/dotfiles/nvim'
alias dotbash='vim /home/bryan/dev/dotfiles/bash/.bashrc'
alias sdnow='shutdown now'
alias lines='git diff --numstat | awk '\''{added+=$1; deleted+=$2} END {print "Added:", added, "Deleted:", deleted}'\'''
alias goose='./goose.sh'

# CUSTOM FUNCTIONS
## run okular in the background
okular() {
	if [ "$#" -eq 0 ]; then
		tmux new -d "okular"
	else
		tmux new -d "okular \"$@\""
	fi
}

## show git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\[\033[1;32m\]->  \[\033[1;96m\]\W\[\033[1;31m\]\$(parse_git_branch) \[\033[1;33m\]✗ \[\033[1;37m\]"

# create new note
n() {
  if [ "$#" -eq 0 ]; then
    vim /home/bryan/dev/notes
  else
    cd /home/bryan/dev/notes/ && vim $1.md
  fi
}

# run tmux on start
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi
