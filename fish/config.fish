if status is-interactive
    # Set cursor styles (works for Emacs-like mode as well)
    function set_emacs_cursor
        echo -ne "\e[3 q"  # Blinking underline for Emacs-like mode
    end

    function fish_prompt
        set_emacs_cursor
        set -l last_status $status
        
        # Basic prompt elements with Monokai colors
        set_color F8F8F2 # Monokai foreground
        printf '['
        set_color 66D9EF # Monokai blue
        printf '%s' $USER
        set_color AE81FF # Monokai purple
        printf '@'
        set_color A6E22E # Monokai green
        printf '%s' (hostname)
        set_color F8F8F2 # Monokai foreground
        printf ']'
        printf ':'
        set_color FD971F # Monokai orange
        printf '%s' (prompt_pwd)
        
        # Git status
        if test -d .git; or git rev-parse --git-dir >/dev/null 2>&1
            set_color green
            printf ' [%s]' (git branch --show-current)
            
            # Check for changes
            if test -n "(git status --porcelain 2>/dev/null)"
                set_color red
                printf ' ✗'
            else
                set_color green
                printf ' ✓'
            end
            
            # Check for stash
            set -l stash_count (git stash list 2>/dev/null | wc -l)
            if test $stash_count -gt 0
                set_color brown
                printf ' ⚑ %s' $stash_count
            end
        end
        
        # Show exit status if non-zero
        if test $last_status -ne 0
            set_color red
            printf ' ✘ %d' $last_status
        end
        
        # New line and prompt symbol
        printf '\n'
        set_color F8F8F2 # Monokai foreground
        printf '> '
        set_color normal
    end

    # Monokai color scheme
    set -g fish_color_normal F8F8F2 # Default text color
    set -g fish_color_command A6E22E # Commands
    set -g fish_color_quote E6DB74 # Quoted text
    set -g fish_color_redirection FD971F # Redirections
    set -g fish_color_end F92672 # Process separators like ';' and '&'
    set -g fish_color_error F92672 # Syntax errors
    set -g fish_color_param 66D9EF # Command parameters
    set -g fish_color_comment 75715E # Comments
    set -g fish_color_match F8F8F2 # Matching parenthesis
    set -g fish_color_selection 49483E # Selected text
    set -g fish_color_search_match --background=49483E # Search matches
    set -g fish_color_operator AE81FF # Operators like '*' and '~'
    set -g fish_color_escape 66D9EF # Escape sequences
    set -g fish_color_autosuggestion 75715E # Autosuggestions
    set -g fish_color_cancel F92672 # Canceled command

    # Pager colors
    set -g fish_pager_color_prefix F8F8F2 # Prefix string
    set -g fish_pager_color_completion 75715E # Completion itself
    set -g fish_pager_color_description 75715E # Completion description
    set -g fish_pager_color_progress 75715E # Progress bar
    set -g fish_pager_color_selected_background --background=49483E # Selected background

    # Disable greeting
    set -g fish_greeting

    # Basic Aliases
    alias open 'xdg-open'
    alias .. 'cd ..'
    alias ... 'cd ../..'
    alias desk 'cd ~/Desktop'
    alias gcf 'cd $HOME/.config'
    alias gdl 'cd $HOME/Downloads'
    alias tree 'tree -c'
    alias x 'exit'
    alias cls 'clear'
    alias l 'ls -l'
    alias ls 'eza -al --header --icons --group-directories-first'
    alias ll 'eza -ll --color=always --group-directories-first'
    alias ldot 'ls -ld .*'
    alias df 'df -h'
    alias top 'btm -b'
    alias fetch 'fastfetch --config examples/20'
    alias switch-external 'rm $HOME/.config/hypr/conf/monitor.conf && echo "source = ~/.config/hypr/conf/monitors/two-monitors.conf" > $HOME/.config/hypr/conf/monitor.conf'
    alias switch-internal 'rm $HOME/.config/hypr/conf/monitor.conf && echo "source = ~/.config/hypr/conf/monitors/laptop-default.conf" > $HOME/.config/hypr/conf/monitor.conf'


    # System commands
    alias mem 'free -h | grep Mem'
    alias ports 'netstat -tulanp'
    alias path 'echo $PATH | tr : "\n"'
    alias battery 'upower -i /org/freedesktop/UPower/devices/battery_BAT0'
    alias weather 'curl wttr.in'
    alias ip 'ip -c a'
    alias ping 'ping -c 5'
    alias leet 'nvim leetcode.nvim'
    
    # Network related aliases
    alias init-vmnet 'sudo virsh net-start default'
    alias init-hotspot 'nmcli connection up "Internet gratis y seguro ;)"'
    alias kill-hotspot 'nmcli connection down "Internet gratis y seguro ;)"'
    
    # Recording aliases
    alias record-screen 'ffmpeg -f x11grab -r 30 -s 1920x1200 -i :0.0 -f pulse -i default -c:v libx264 -preset ultrafast -c:a aac -strict experimental -b:a 192k ~/Desktop/output.mp4'
    alias record-laptop-screen 'ffmpeg -f x11grab -r 30 -s 1366x768 -i :0.0 -f pulse -i default -c:v libx264 -preset ultrafast -c:a aac -strict experimental -b:a 192k ~/Desktop/output.mp4'
    
    # OpenSUSE package management
    alias install 'sudo zypper install'
    alias remove 'sudo zypper remove'
    alias search 'zypper search'
    alias update 'sudo zypper refresh'
    alias upgrade 'sudo zypper up'
    alias full-upgrade 'sudo zypper dup; sudo zypper clean; sudo flatpak update -y'
    alias cleanup 'sudo zypper clean -a'
    alias orphans 'sudo zypper packages --unneeded'
    
    # Development aliases
    alias fs 'nvim ~/.config/fish/config.fish'
    alias reload 'cls && source ~/.config/fish/config.fish'
    alias v 'neovide'
    alias gc 'git clone'
    alias fomo 'git fetch && git pull --all'

    # File operations
    alias cp 'cp -iv'
    alias mv 'mv -iv'
    alias rm 'rm -iv'
    alias mkdir 'mkdir -pv'

    # System maintenance
    alias update-grub 'sudo grub2-mkconfig -o /boot/grub2/grub.cfg'
    alias caps 'setxkbmap -option caps:escape'
    alias wget 'wget -c'
    alias df 'df -h'
    alias du 'du -h'
    alias free 'free -h'
    
    # Network
    alias myip 'curl ifconfig.me'
    alias localip 'hostname -I'
    alias ports 'netstat -tulanp'

    # Protontricks
    alias protontricks 'flatpak run com.github.Matoking.protontricks'
    alias protontricks-launch 'flatpak run --command=protontricks-launch com.github.Matoking.protontricks'
    
    # Set LS_COLORS for Monokai theme
    set -Ux LS_COLORS "di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
    
    # Environment Variables
    set -gx PATH ~/bin $PATH
    set -gx PATH ~/.local/bin $PATH
    set -gx PATH /usr/local/go/bin $PATH
    set -gx PATH ~/.cargo/bin $PATH
    set -gx VISUAL neovide
    set -gx EDITOR neovide
    
    # Android SDK
    set -gx ANDROID_HOME $HOME/Android/Sdk
    set -gx PATH $PATH $ANDROID_HOME/emulator
    set -gx PATH $PATH $ANDROID_HOME/tools
    set -gx PATH $PATH $ANDROID_HOME/tools/bin
    set -gx PATH $PATH $ANDROID_HOME/platform-tools
    
    # Other environment variables
    set -gx NO_POINTER_VIEWPORT 1
    set -gx MANPAGER 'nvim +Man!"set nocul" +"set noshowcmd" +"set noruler" +"set noshowmode" +"set laststatus=0" +"set showtabline=0" +"set nonumber"'
    
    # PyEnv initialization
    set -gx PATH $HOME/.pyenv/bin $PATH
    pyenv init --path | source
    pyenv init - | source
    
    # Node.js
    set -gx PATH ~/.npm-global/bin $PATH
    
    # Bun
    # set -gx BUN_INSTALL $HOME/.bun
    # set -gx PATH $BUN_INSTALL/bin $PATH

    # Dotnet
    set -gx DOTNET_INSTALL $HOME/.dotnet
    set -gx PATH $DOTNET_INSTALL $PATH
    # Dotnet tools
    set -gx PATH $DOTNET_INSTALL/tools $PATH

    # Android
    set -gx ANDROID_SDK_TOOLS $HOME/Android/cmdline-tools/bin
    set -gx PATH $ANDROID_SDK_TOOLS $PATH

    
    if [ (random 1 2) = 2 ] && type -q fortune
        fortune
        echo
    else
        misfortune
        echo
    end
end

