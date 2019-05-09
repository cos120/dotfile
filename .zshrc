# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ATHAME_ENABLED=0
# Path to your oh-my-zsh installation.
export ZSH="/home/zj/.oh-my-zsh"
export TERM=xterm-256color
eval `dircolors ~/.dircolors/dircolors.256dark`
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pygmalion"
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export PATH=$PATH:/home/zj/software/bin
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
#export PAGER='vim -c "%s/.//g" -'
#compdef _ac ac
#autoload -U compinit
#compinit

plugins=(
  git
  extract
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
  vi-mode
  percol
)

source $ZSH/oh-my-zsh.sh
if [[ `tty` =~ "^/dev/tty[1-9]+" ]]; then
    setfont /usr/share/consolefonts/Uni3-Terminus32x16.psf.gz
fi

function reset_all(){
	brightness=1
	echo $brightness > ~/.brightness
	for i in `xrandr -q | grep -w connected | awk '{print $1}'`;do
		xrandr --output $i --brightness 1
	done
}
function dec_all(){
	for i in `xrandr -q | grep -w connected | awk '{print $1}'`;do
		dec $i;
	done
}
function inc_all(){
	for i in `xrandr -q | grep -w connected | awk '{print $1}'`;do
		inc $i;
	done
}
function dec(){
	if [[ $brightness -gt 0 ]]; then
		#$(( brightness = brightness - 0.1 ))
		brightness=`echo "scale=1; $brightness - 0.1" | bc -l`
		xrandr --output $1 --brightness "0$brightness"
	fi
}

function inc(){
	if [[ $brightness -lt 1 ]]; then
		#$(( brightness = brightness - 0.1 ))
		brightness=`echo "scale=1; $brightness + 0.1" | bc -l`
		xrandr --output $1 --brightness "0$brightness"
	fi
}
function ac(){
    source /home/zj/envs/$1/bin/activate
}

function pro(){
    previous_command=`fc -ln -1`
    if [[ $previous_command ]];then
        if [[ $previous_command =~ '^sudo*' ]];then
            command=$(echo $previous_command | sed -e "s/^sudo/& proxychains4/")
        else
            command=$(echo $previous_command | sed -e "s/^/proxychains4 /")
        fi
    echo -e "\e[31mcommand is: $command\e[0m"
    eval $command
fi

}
function ycm(){
    export MY_YCM=
    for i in $@;do
        if [[ -z $MY_YCM ]];then
            export MY_YCM=$(realpath $i)
        else
            export MY_YCM=$MY_YCM:$(realpath $i)
        fi
    done
    echo $MY_YCM
}
eval $(thefuck --alias)
#alias headset="a2dp.py CC:98:8B:49:D7:E5"
bindkey -a '^[[3~' delete-char
