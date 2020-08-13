### Delete MacOS application files

`delete_app_files`

For deleting an app on MacOS.  Delete the main app file from `/Applications` on your own, then run this to clean up all of it's preference, library, startup, and user files that are scattered around.

Fear not!  It won't automatically delete anything.  It will give you list of files, and then ask if you want to delete them all in one go.  You can say yes, or you can use the list to delete them yourself if you see mistakes in the list.

It takes a space-separated list of search terms as arguments.  They're case-insensitive, but if you use a space in the search term, surround it with quotes.

Example usage:
```
./delete_app_files.sh spotify zoom
```

### Timestamped log

`ts`

A tool to add timestamped entries to a daily log file.  Each entry has:

- current time
- message
- time since last entry if this is not the first entry of the day

If there is no log file present for the current day it creates one.

Example usage:
```
ts Here is one entry, no quotes are necessary.
```

Example file created:

```
13:21:21 leaving for lunch
13:51:54 Here is one entry, no quotes are necessary. 0:30:33
15:29:21 back from lunch 1:37:27
```

### Quick SSH proxy toggle

`proxy.sh`

Sets up or turns off a web proxy in MacOs.  To make this work you'll also want to set up a rule in your `~/.ssh/config` file, replacing the example stuff with the info for the server you want to proxy through:

```
Host    example
    Hostname        93.184.216.34
    user            myusername
    LocalForward        3128 squid.example.com:3128
```

Example usage: just run it with no arguments and it will prompt you for passwords as necessary.  It's quite verbose about letting you know what it's doing.
