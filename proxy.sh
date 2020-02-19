#!/bin/bash

# by Holly Hudson
# Sets up a web proxy in MacOS so you don't have to hunt through menus to
# change settings every time.  Last I checked this wasn't working with
# Firefox, only Safari.
#
# use:
# Run this command to turn it on and turn it off -- it will set one up if
# none is in place, and if one is set up it will turn it off.

e=$(networksetup -getwebproxy wi-fi | grep "No")

if [ -n "$e" ]; then
	echo "Setting web proxy state, wifi on"
	sudo networksetup -setwebproxystate wi-fi on
	echo "Setting secure web proxy state, wifi on"
	sudo networksetup -setsecurewebproxystate wi-fi on
	echo "ssh'ing to swcp"
	# create a local forwarding rule in your ~/.ssh/config to use below
	ssh swcp
	echo "done"
else
	echo "Setting web proxy state, wifi off"
	sudo networksetup -setwebproxystate wi-fi off
	echo "Setting secure web proxy state, wifi off"
	sudo networksetup -setsecurewebproxystate wi-fi off
	echo "done"
fi

