#!/bin/sh

# case insensitive resource match
inputrc=~/.inputrc

INPUTRCS="
/etc/inputrc"
for rc in $INPUTRCS
do
    if [ -f $rc ]; then
        inputrc=$rc;
        break;
    fi
done

INPUTRULES="
set completion-ignore-case on
set show-all-if-ambiguous on
set completion-prefix-display-length 2"
oldIFS=$IFS
IFS=$'\n'
for rule in $INPUTRULES
do
    echo $rule;
    val=$(grep -i $rule $inputrc)
    if [ $? -gt 0  ]; then
        #echo "$rule" >> $inputrc;
        echo "did not find match";
    fi
done
IFS=$oldIFS

source $inputrc

echo "alias ll='ls -alr'" >> ~/.bash_profile
echo "alias ..='cd ..'" >> ~/.bash_profile
echo "alias ..2='cd ../..'" >> ~/.bash_profile
echo "alias ..3='cd ../..'" >> ~/.bash_profile

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
