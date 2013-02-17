#!/bin/sh

# case insensitive resource match
inputrc=~/.inputrc

INPUTRCS="
/etc/inputrc"
for rc in $INPUTRCS
do
    if [ -f $rc && -w $rc ]; then
        inputrc=$rc;
        break;
    fi
done

if [ -f $inputrc ]; then
    touch $inputrc;
fi

INPUTRULES="
set completion-ignore-case on
set show-all-if-ambiguous on
set completion-prefix-display-length 2"
oldIFS=$IFS
IFS=$'\n'
for rule in $INPUTRULES
do
    val=$(grep -i $rule $inputrc)
    if [ $? -gt 0  ]; then
        echo "$rule" >> $inputrc;
    fi
done

bind -f $inputrc

# copy some aliases to bash_profile
ALIASES="
alias ll='ls -alr'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../..'"
for full_alias in $ALIASES
do
    alias=$(echo $full_alias | cut -d'=' -f1)
    val=$(grep -i $alias ~/.bash_profile)
    if [ $? -gt 0  ]; then
        echo "$full_alias" >> ~/.bash_profile;
    fi
done

IFS=$oldIFS

# ack - the better grep
PATHDIRS="
$HOME/bin
/usr/local/bin
/usr/bin"
for dir in $PATHDIRS
do
    if [ `echo $PATH | grep $dir` ]; then
        mkdir -p $dir
        curl http://betterthangrep.com/ack-standalone > $dir/ack && chmod 0755 $dir/ack
        break
    fi
done

source ~/.bash_profile
