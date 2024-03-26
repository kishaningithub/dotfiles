# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set PATH - Paths are prepended to ensure homebrew deps get first priority
export PATH="/opt/homebrew/bin:$PATH" # Solve chicken and egg problem of homebrew binary being not present in path
export PATH="$(brew --prefix)/opt/openjdk@11/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$HOME/.local_launchers:$PATH"
export PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/ruby/bin:$PATH"
export PATH="$(brew --prefix)/opt/sqlite/bin:$PATH"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home"
export HOMEBREW_EDITOR=code

# GnuPG TTY config - This makes code signing work
export GPG_TTY=$(tty)

alias lb='./build_scripts/local_build.sh'
alias crash_notifier='node $HOME/Programming/Learn/node-js/post-receiver.js'

# alias idea='open -a IntelliJ\ IDEA.app --args "$@"'
alias ideaC='open -a /Applications/IntelliJ\ IDEA\ CE.app'
alias as='open -a /Applications/Android\ Studio.app'
alias ssm='aws ssm get-parameters-by-path --path /config/$(basename `pwd`)_dev --recursive --with-decryption | jq -r '\''.Parameters[] | "\(.Name) : \(.Value)"'\'' | fzf'
alias ssm_list='aws ssm get-parameters-by-path --path /config/$(basename `pwd`)_dev --recursive --with-decryption | jq -r '\''.Parameters[] | "\(.Name) : \(.Value)"'\'''
alias ssm_localstack='aws ssm get-parameters-by-path --path /config/$(basename `pwd`)_dev --recursive --endpoint-url http://localhost:4583 | jq -r '\''.Parameters[] | "\(.Name) : \(.Value)"'\'' | fzf'
alias ssm_qa='aws ssm get-parameters-by-path --path /config/$(basename `pwd`)_qa --recursive | jq -r '\''.Parameters[] | "\(.Name) : \(.Value)"'\'' | fzf'
alias ssm_qa_list='aws ssm get-parameters-by-path --path /config/$(basename `pwd`)_qa --recursive --with-decryption | jq -r '\''.Parameters[] | "\(.Name) : \(.Value)"'\'''
alias ssm_stg='aws ssm get-parameters-by-path --path /config/$(basename `pwd`)_stg --recursive | jq -r '\''.Parameters[] | "\(.Name) : \(.Value)"'\'' | fzf'
alias ssm_stg_list='aws ssm get-parameters-by-path --path /config/$(basename `pwd`)_stg --recursive | jq -r '\''.Parameters[] | "\(.Name) : \(.Value)"'\'''

ulimit -S -n 9999

ssh-add --apple-use-keychain ~/.ssh/id_rsa
ssh-add --apple-use-keychain ~/.ssh/gilead_rsa

clone-db () {
  db="$1"
  env="$2"
  dropdb "$1"
  createdb "$1"
  eval "pgdump_$1_$2 | pgcli $1"
}

alias adbsqlite="osascript $HOME/Programming/Personal/apple-scripts/open_sra_sqlite_db.scpt"

alias gcx="gco \$(git branch -a | sed -E 's/remotes\/([a-zA-Z-]*\/)//' | rg -v '\*|HEAD' | sort |uniq | fzf --select-1)"

# >>> talisman >>>
## Kishan - Git hook template is setup in ~/.git-template/hooks/pre-commit
# Below environment variables should not be modified unless you know what you are doing
# export TALISMAN_HOME=~/.talisman/bin
# alias talisman=$TALISMAN_HOME/talisman_darwin_amd64
# <<< talisman <<<

# Dir env
eval "$(direnv hook zsh)"

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

## Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

## Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Add fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh sytax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


## Project specific aliases
## TODO - move it to project specific folder
story() {
   number="$1";
   open "https://gileaddevops.atlassian.net/browse/${number}"
}

mkcd() {
    mkdir -p "${1}"
    cd "${1}"
}

gsup() {
  git branch --set-upstream-to=origin/$(git branch --show-current) $(git branch --show-current)
}

assume-role() {
  ROLE_ARN="${1}"
  SESSION_NAME="${2}"

  output=$(aws sts assume-role --role-arn "$ROLE_ARN" --role-session-name "$SESSION_NAME")
  export AWS_ACCESS_KEY_ID=$(echo "$output" | jq -r '.Credentials.AccessKeyId')
  export AWS_SECRET_ACCESS_KEY=$(echo "$output" | jq -r '.Credentials.SecretAccessKey')
  export AWS_SESSION_TOKEN=$(echo "$output" | jq -r '.Credentials.SessionToken')

  echo "Assumed IAM role '$ROLE_ARN' and exported temporary AWS credentials as environment variables."
}

sync-repos() {
  ORG_NAME="${1}"
  no_of_cpus=$(sysctl -n hw.ncpu)
  gh repo list "${ORG_NAME}" --json sshUrl --jq '.[] | .sshUrl' --limit 1000 | xargs -I {} -P ${no_of_cpus} -n 1 git clone {}
  ls -1 | xargs -I {} -P ${no_of_cpus} -n 1 git -C {} pull --rebase --autostash
}

alias bupc='brew update && brew upgrade && brew cleanup && brew autoremove'

if command -v pyenv &> /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  unset PYENV_VERSION
fi

if command -v thefuck &> /dev/null; then
  eval $(thefuck --alias fix)
fi

if command -v colima &> /dev/null; then
  colima start --network-address --disk 10
  # Making colima work with test containers
  export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
  export DOCKER_HOST="unix://${HOME}/.colima/docker.sock"
  ## https://github.com/dizney/testcontainers-with-colima
  export TESTCONTAINERS_HOST_OVERRIDE="$(colima ls -j  | grep "address" | jq -r '.address')"
fi

if command -v asdf &> /dev/null; then
  . $(brew --prefix)/opt/asdf/libexec/asdf.sh
fi

mkdir -p ~/.local_launchers

cat <<EOF > ~/.local_launchers/idea
#!/usr/bin/env bash

set -eu

open -na "IntelliJ IDEA.app" --args "$@"
EOF

chmod +x ~/.local_launchers/idea


## pkgx start
if command -v pkgx &> /dev/null; then
  source <(pkgx --shellcode)  #docs.pkgx.sh/shellcode
fi

if command -v rtx &> /dev/null; then
  eval "$(rtx activate zsh)"
fi

# if command -v dev &> /dev/null; then
#  dev off && dev
# fi
## pkgx end