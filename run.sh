# case insensitive resource match
echo "set completion-ignore-case On" >> ~/.inputrc
echo "set show-all-if-ambiguous on" >> ~/.inputrc
echo "set completion-prefix-display-length 2" >> ~/.inputrc
source .inputrc

# ack - the better grep
curl http://betterthangrep.com/ack-standalone > /usr/local/bin/ack && chmod 0755 !#:3
