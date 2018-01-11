#!/bin/bash
# Author Br1an6

# The Local IP of the NAS
synip='192.168.0.101'

echo "[*] Check for homebrew"
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "[*] Not found_Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else    
	echo "[*] Found Homebrew and Updating"
    brew update
    brew upgrade
    brew clean
fi

echo "[*] Check for upnpc"
if [[ $(which upnpc) == "upnpc not found" ]] ; then
    # Install Upnp client
    echo "[*] Not found_Installing Upnp client"
    brew install miniupnpc
fi

# myip=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
echo "[*] Start removing rules with IP: $synip"
# edit this part if needed
# upnpc -a IP port external-port protocal
echo "[*] DSM 5000 5001"
upnpc -d 5000 TCP
upnpc -d 5001 TCP

echo "[*] FTP 21"
upnpc -d 21 TCP

echo "[*] Cloud Station 6690"
upnpc -d 6690 TCP

echo "[*] Photo Station Web Station 80 443"
upnpc -d 80 TCP
upnpc -d 443 TCP

echo "[*] VPN Server L2TP 500 1701 4500"
upnpc -d 500 UDP
upnpc -d 1701 UDP
upnpc -d 4500 UDP

echo "[*] Done"