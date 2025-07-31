# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bureau"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    cp
    zsh-completions
    fzf-tab
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Aliases
alias cat='batcat'
alias sail='./vendor/bin/sail'
alias connect-oracle-server='ssh rocky@193.122.151.14'
alias open='xdg-open'
alias ..='cd ..'
alias ...='cd ../..'
alias gcf='cd $HOME/.config'
alias gdl='cd $HOME/Downloads'
alias mkdir='mkdir -p'
alias tree='tree -c'
alias x='exit'
alias hx='helix'
alias cls='clear'
alias my-ipv6='curl ysap.sh/ip'
alias roblox='flatpak run org.vinegarhq.Sober'
alias ll='eza -ll --color=always --group-directories-first'
alias ls='eza -al --header --icons --group-directories-first'
alias df='df -h'
alias top='btm -b'
alias free='free -h'
alias init-vmnet='sudo virsh net-start default'
alias init-hotspot='nmcli connection up "Internet gratis y seguro ;)"'
alias kill-hotspot='nmcli connection down "Internet gratis y seguro ;)"'
alias record-screen='ffmpeg -f x11grab -r 30 -s 1920x1200 -i :0.0 -f pulse -i default -c:v libx264 -preset ultrafast -c:a aac -strict experimental -b:a 192k ~/Desktop/output.mp4'
alias record-laptop-screen='ffmpeg -f x11grab -r 30 -s 1366x768 -i :0.0 -f pulse -i default -c:v libx264 -preset ultrafast -c:a aac -strict experimental -b:a 192k ~/Desktop/output.mp4'

# Aliases for package management in Ubuntu
alias install='sudo nala install'
alias remove='sudo nala remove'
alias search='nala search'
alias update='sudo nala update'
alias upgrade='sudo nala upgrade'

# Dotfiles & Files
alias zs='nvim ~/.zshrc'
alias reload='source ~/.zshrc'
alias v="nvim"
alias leet="nvim leetcode.nvim"
alias gc="git clone"
alias fomo="git fetch --all && git pull --all"

# Add Color
alias egrep='grep --color=auto'

# Protontricks
alias protontricks='flatpak run com.github.Matoking.protontricks'
alias protontricks-launch='flatpak run --command=protontricks-launch com.github.Matoking.protontricks'

export PATH="~/bin:$PATH"
export PATH="~/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="~/.cargo/bin:$PATH"
export PATH="~/Documents/Programas/swift-5.10.1-RELEASE-fedora39/usr/bin:$PATH"
export PATH="~/.dotnet/tools/:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.dotnet:$PATH"
export DOTNET_ROOT="$HOME/.dotnet"
export VISUAL=nvim;
export EDITOR=nvim;
export PATH=~/.npm-global/bin:$PATH
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

clear
if [ -x $(which fortune) ] ; then
    echo
        fortune -s
    echo
fi

# export MANPAGER='nvim +Man!+"set nocul" +"set noshowcmd" +"set noruler" +"set noshowmode" +"set laststatus=0" +"set showtabline=0" +"set nonumber"'

# pnpm
export PNPM_HOME="/home/ramonkey/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# composer
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
# cargo
export PATH="$PATH:$HOME/.cargo/bin/"

