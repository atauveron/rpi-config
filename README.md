# RPi-config
Configuration files and miscellaneous scripts for my RPi


### .zshrc
I use zsh with the [oh-my-zsh](http://ohmyz.sh/) framework and the [oh-my-via](https://github.com/badouralix/oh-my-via) theme.


### dhcpcd.conf
Configuration file to use a static IP address.


### iptables
Simple IPv4 rules, for accepting connections from a local network (192.168.0.0/16) and dropping everything else.
No IPv6 support (everything is dropped).
Load the rules with `iptables-restore < rules.v4` and `ip6tables-restore < rules.v4`.


### fail2ban
Fail2ban configuration files, for protection against DoS attacks through ssh.