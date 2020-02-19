`ts`

A tool to add timestamped entries to a logfile.  Includes the time since last entry in each entry.

`proxy.sh`

Sets up or turns off a web proxy in MacOs.  To make this work you'll also want to set up a rule in your `~/.ssh/config` file, replacing the example stuff with the info for the server you want to proxy through:

```
Host    example
    Hostname        93.184.216.34
    user            myusername
    LocalForward        3128 squid.example.com:3128
```
