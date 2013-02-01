# case insensitive resource match
echo "set completion-ignore-case On" >> ~/.inputrc
echo "set show-all-if-ambiguous on" >> ~/.inputrc
echo "set completion-prefix-display-length 2" >> ~/.inputrc
source ~/.inputrc

echo "alias ll='ls -alr'" >> ~/.bash_profile
echo "alias ..='cd ..'" >> ~/.bash_profile
echo "alias ..2='cd ../..'" >> ~/.bash_profile
source ~/.bash_profile

# ack - the better grep
PATHDIRS="
$HOME/bin
/usr/local/bin
/usr/bin"
for dir in $PATHDIRS
do
    if [ `echo $PATH | grep $dir` ]; then
        curl http://betterthangrep.com/ack-standalone > $dir/ack && chmod 0755 $dir/ack
        break
    fi
done

