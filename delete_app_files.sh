#!/bin/bash
# Author: Holly Hudson, with help from Trammell Hudson

help="          Usage:
List your search terms as arguments.
Search terms are case insensitive.
If your arguments have spaces, surround them in quotes."

# show the help message if requested
if [ "$1" = "" ] || [ "$1" = -h ] || [ "$1" = --help ]
then
	echo "$help"
	exit
fi

# paths returned from find, in case we want to delete them
search_result=""

# list of those paths saved for batch action
filelist=""

# define newline
NL="
"

echo "Clean up time!"

for dir in \
/Library/Application\ Support \
/Library/Preferences \
/Library/PreferencePanes \
/Library/LaunchDaemons \
/Library/LaunchAgents \
/Library/StartupItems \
$HOME/Library/Application\ Support \
$HOME/Library/Preferences \
$HOME/Library/PreferencePanes \
$HOME/Library/LaunchAgents \
$HOME/Library/Saved\ Application\ State \
; do
	for searchterm in "$@"
	do
		# -- means end of options
		search_result="$(find "$dir" -maxdepth 1 | grep -i -- "$searchterm")"
		if [ "$search_result" != "" ]
		then
			echo "$search_result"
			filelist+="$search_result$NL"
			search_result=""
		fi
	done
done

read -r -p  "Do you want to PERMANENTLY DELETE ALL of these? [y/N]" response
if [[ "$response" =~ ^(yes|y)$ ]]
then
	# IFS is the input field separator env var, applies to this for statement
	IFS="$NL"
	# no quotes around filelist because you want to expand the newlines
	for file in $filelist ; do
		rm -rf "$file"
	done
	exit
fi
