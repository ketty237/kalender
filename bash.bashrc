[ -z "$PS1" ] && return

# Bash completion
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

# Define a few Colours
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

###############
### aliases ###
###############

# General
alias df='df -h'
alias h='history'
alias sd='cd /sdcard'
alias duck='du -skc * | sort -rn'
alias nb='nano ../usr/etc/bash.bashrc'



# System info
alias cpuu="ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu | sed '/^ 0.0 /d'"
alias memu='ps -e -o rss=,args= | sort -b -k1,1n | pr -TW$COLUMNS'
alias pg='ps aux | grep'  #requires an argument



# interactive
alias cp='cp -vi'
alias mv='mv -vi'
alias rm='mv --target-directory=$HOME/.Trash/'

# Directory navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'



# listings
alias ls='ls --color=auto'
alias lh='ls -lah'                # human readable (sizes) long and all ;-)
alias lls='ls -l -h -g -F --color=auto'
alias lc='ls -aCF'
alias lsam='ls -am'               # List files horizontally
alias lr='ls -lR'                 # recursive
alias lsx='ls -ax'                # sort right to left rather then in columns
alias lss='ls -shAxSr'            # sort by size
alias lt='ls -lAtrh'              # sort by date and human readable
alias lm='ls -al |more'           # pipe through 'more'


# chmod and permissions commands
alias mx='chmod a+x'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'


# WELCOME SCREEN
#######################################################

clear

echo -ne "${LIGHTGREEN}" "Hello, `whoami`. today is, "; date
echo -e "${WHITE}"; cal ;
echo -ne "${CYAN}";
echo -ne "${LIGHTPURPLE}Sysinfo:";uptime ;echo ""


# NOTES
#######################################################

# To temporarily bypass an alias, we preceed the command with a \
# EG:  the ls command is aliased, but to use the normal ls command you would
# type \ls

#################
### FUNCTIONS ###
#################

function    ff               { find . -name $@ -print; }

function    rmd              { rm -fr $@; }

function    osr              { shutdown -r now; }
function    osh              { shutdown -h now; }

function    mfloppy          { mount /dev/fd0 /mnt/floppy; }
function    umfloppy         { umount /mnt/floppy; }

function    mdvd             { mount -t iso9660 -o ro /dev/dvd /mnt/dvd; }
function    umdvd            { umount /mnt/dvd; }

function    mcdrom           { mount -t iso9660 -o ro /dev/cdrom /mnt/cdrom; }
function    umcdrom          { umount /mnt/cdrom; }

function    psa              { ps aux $@; }
function    psu              { ps  ux $@; }

function    dub              { du -sclb $@; }
function    duk              { du -sclk $@; }
function    dum              { du -sclm $@; }

function    dfk              { df -PTak $@; }
function    dfm              { df -PTam $@; }
function    dfh              { df -PTah $@; }
function    dfi              { df -PTai $@; }

# SPECIAL FUNCTIONS
#######################################################

# clock - A bash clock that can run in your terminal window.
clock ()
{
while true;do clear;echo "===========";date +"%r";echo "===========";sleep 1;done
}

netinfo ()
{
echo "--------------- Network Information ---------------"
/sbin/ifconfig | awk /'inet addr/ {print $2}'
echo ""
/sbin/ifconfig | awk /'Bcast/ {print $3}'
echo ""
/sbin/ifconfig | awk /'inet addr/ {print $4}'

# /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
echo "---------------------------------------------------"
}

# Define a word - USAGE: define dog
define ()
{
lynx -dump "http://www.google.com/search?hl=en&q=define%3A+${1}&btnG=Google+Search" | grep -m 3 -w "*"  | sed 's/;/ -/g' | cut -d- -f1 > /tmp/templookup.txt
   if [[ -s  /tmp/templookup.txt ]] ;then
    until ! read response
     do
     echo "${response}"
     done < /tmp/templookup.txt
    else
     echo "Sorry $USER, I can't find the term \"${1} \""  
   fi
\rm -f /tmp/templookup.txt
}

#####################################
# ##### ENVIRONMENT VARIABLES ##### #
#####################################

declare -x HISTFILE=~/.bash_history
declare -x HISTCONTROL=ignoredups
declare -x HISTFILESIZE=100000
declare -x HISTSIZE=100000




############################## ##################################
# ##### PROMPT SECTION ##### ####################################
############################## ##################################

##PS1="\[ [32m\]\u:\w > \[ [39m\]"
##PS1="\[ [31m\][\[ [32m\]\u\[ [31m\]]\[ [32m\]\w > \[ [39m\]"
#PS1="\[ [40;1;31m\][\[ [1;32m\]\u\[ [1;31m\]]\[ [49;1;32m\]\w > \[ [22;39m\]"
#PS1="\[ [1;31m\][\[ [1;32m\]\[ [47m\]\u\[ [1;31m\]\[ [49m\]]\[ [1;32m\]\w > \[ [22;39m\]"
##PS1="\[ [31m\][\[ [36m\]\u\[ [31m\]]\[ [36m\]\w > \[ [39m\]"
#PS1="\[ [32m\]\u \[ [39m\]\$\[ [32m\] \w \[ [39m\]"

###################### the above is a separate prompt which can be used instead of below. NOTE: only ONE line at a time should be uncommented. so there are 6 different prompts above!!!!!

# color_name='\[\033[ color_code m\]'

rgb_restore='\[\033[00m\]'
rgb_black='\[\033[00;30m\]'
rgb_firebrick='\[\033[00;31m\]'
rgb_red='\[\033[01;31m\]'
rgb_forest='\[\033[00;32m\]'
rgb_green='\[\033[01;32m\]'
rgb_brown='\[\033[00;33m\]'
rgb_yellow='\[\033[01;33m\]'
rgb_navy='\[\033[00;34m\]'
rgb_blue='\[\033[01;34m\]'
rgb_purple='\[\033[00;35m\]'
rgb_magenta='\[\033[01;35m\]'
rgb_cadet='\[\033[00;36m\]'
rgb_cyan='\[\033[01;36m\]'
rgb_gray='\[\033[00;37m\]'
rgb_white='\[\033[01;37m\]'

rgb_std="${rgb_white}"

if [ `id -u` -eq 0 ]
then
    rgb_usr="${rgb_red}"
else
    rgb_usr="${rgb_green}"
fi

[ -n "$PS1" ] && PS1="${rgb_usr}`whoami`${rgb_std} \W ${rgb_usr}\\\$${rgb_restore} "

unset   rgb_restore   \
        rgb_black     \
        rgb_firebrick \
        rgb_red       \
        rgb_forest    \
        rgb_green     \
        rgb_brown     \
        rgb_yellow    \
        rgb_navy      \
        rgb_blue      \
        rgb_purple    \
        rgb_magenta   \
        rgb_cadet     \
        rgb_cyan      \
        rgb_gray      \
        rgb_white     \
        rgb_std       \
        rgb_usr
