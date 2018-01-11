# Synology-port-forwarding
Synology NAS port forwarding using UPnP
> Using Homebrew with [MiniUPnP](http://miniupnp.tuxfamily.org)

Simply Run:

To add port forwarding rules:

`./add_rules.sh`

To remove port forwarding rules:

`./remove_rules.sh`


If there is any permisson error run ( `sudo` if needed ):

e.g.

`chmod +x add_rules.sh`

###### Edit the script if needed:
> e.g. Change line 5 "synip" to the IP of your Synology NAS.
To add rule
`upnpc -a IP port external-port protocal`
To delete rule
`upnpc -d port protocal`

[What network ports are used by Synology services?](https://www.synology.com/en-us/knowledgebase/DSM/tutorial/General/What_network_ports_are_used_by_Synology_services)
