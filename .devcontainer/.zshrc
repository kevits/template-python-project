# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="devcontainers"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/antigen.zsh

antigen use oh-my-zsh

# Load bundles from the default repo (https://github.com/robbyrussell/oh-my-zsh.git)
antigen bundle command-not-found
antigen bundle common-aliases
# antigen bundle docker
antigen bundle git
antigen bundle git-extras
antigen bundle history-substring-search
antigen bundle zsh-interactive-cd

# Load bundles from external repos
# Jump quickly to directories that you have visited frequently - https://github.com/agkozak/zsh-z
antigen bundle "agkozak/zsh-z"
# Fuzzy completions for fzf and Zsh (git, kubectl, docker, ...) - https://github.com/chitoku-k/fzf-zsh-completions
antigen bundle "chitoku-k/fzf-zsh-completions"
# Zsh completion for docker and docker-compose - https://github.com/greymd/docker-zsh-completion
# antigen bundle "greymd/docker-zsh-completion"
# Fish-like autosuggestions for Zsh - https://github.com/zsh-users/zsh-autosuggestions
antigen bundle "zsh-users/zsh-autosuggestions"
# Fish shell like syntax highlighting for Zsh - https://github.com/zsh-users/zsh-syntax-highlighting
antigen bundle "zsh-users/zsh-syntax-highlighting"
# Additional completion definitions for Zsh - https://github.com/zsh-users/zsh-completions
antigen bundle "zsh-users/zsh-completions"

# A Zsh theme - https://github.com/romkatv/powerlevel10k
antigen theme romkatv/powerlevel10k

antigen apply

fpath+=~/.zfunc
autoload -Uz compinit && compinit

# To customize your prompt, run `p10k configure` and edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
