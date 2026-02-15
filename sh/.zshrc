##### ALIASES #####
alias ll='ls -al'
alias cl='clear'
alias sdnow="sudo shutdown -h now"
alias dotf="cd ~/dev/dotfiles/ && vim"

alias t='tmux'
alias kills='tmux kill-session'
alias vim='nvim'
alias lg='lazygit'

alias gem='gemini'

alias pgdb='psql -h localhost -U postgres'

# pnpm
alias p='pnpm'
alias dev='pnpm dev'
alias typc='pnpm typecheck'
alias stu='pnpm prisma studio'
alias dbp='pnpm prisma db push'
alias lfx='pnpm lint --fix && p localesort'

alias mcp='cp prisma/schema.prisma prisma/schema_old.prisma'
alias mdiff='pnpm prisma migrate diff --from-schema-datamodel prisma/schema_old.prisma --to-schema-datamodel prisma/schema.prisma --script'

# go
alias gg='go get'

# python
alias av='source .venv/bin/activate'
alias uvim='uv run nvim'

##### VCS INFO #####

# Load the vcs_info module
autoload -Uz vcs_info

# Configure vcs_info to run before each prompt
precmd() { vcs_info }

# Customize the output format for Git
# %b is for the branch name
# %c is for changes staged for commit
# %u is for un-staged changes
zstyle ':vcs_info:*' formats ' (%b)'
zstyle ':vcs_info:*' actionformats ' (%b|%a)'
zstyle ':vcs_info:(git)*' check-for-changes true
zstyle ':vcs_info:(git)*' unstagedstr '!'
zstyle ':vcs_info:(git)*' stagedstr '+'

# Enable prompt substitution for vcs_info's variables
setopt PROMPT_SUBST

# Add the variable $vcs_info_msg_0_ to your prompt
# The variable holds the formatted git status string (e.g., " (main+!)")
PROMPT='%F{green}%n%f %F{blue}[%f%~%F{blue}]%f%F{yellow}${vcs_info_msg_0_}%f %F{red}➤%f '

##### NVM #####
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

##### POSTGRESQL #####
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export PATH=$PATH:$(go env GOPATH)/bin

##### ZSH #####

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. "$HOME/.local/bin/env"

FPATH="$HOME/.docker/completions:$FPATH"
autoload -Uz compinit
compinit

if [ -f ~/.zshrc.local ]; then 
  . ~/.zshrc.local
fi

# run tmux on startup
if [[ -z "$TMUX" ]]; then
    tmux attach-session -t main || tmux new-session -s main
fi


# opencode
export PATH=/Users/bryan/.opencode/bin:$PATH
