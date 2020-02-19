#!/usr/bin/env python

# by Holly Hudson
# This is a very simple command line activity logger, useful for logging
# the amount of time spent doing tasks.  
# Each time it's invoked it posts an entry, time stamped with the current
# time, into a daily log file.  If it is not the first entry of the day
# it calculates the time since the last entry and includes that in the post.

# Example log file:
# 13:21:21 getting ready to leave
# 13:51:54 leaving for lunch 0:30:33
# 15:29:21 back from lunch 1:37:27

# use:
# ts type log message after command, no quotes needed

import sys
from datetime import datetime

# format log message
msg = ' '.join(sys.argv[1:])

# format date and time stamps
current = datetime.now()
date_stamp = current.strftime('%Y-%m-%d')
time_stamp = current.strftime('%H:%M:%S')

# choose today's log file
logfile = '/Users/holly/log/' + date_stamp + '.log'
print('logging to ' + logfile)

# construct entry
entry = time_stamp + ' ' + msg

with open(logfile, 'a+') as f:
	if f.tell() > 0:
		# this file is not empty, calculate time delta to include in entry
		# first get the timestamp from the last entry in the file
		f.seek(0)
		lines = f.read().splitlines()
		last_line = lines[-1]
		parts = last_line.split(' ')
		time_parts = parts[0].split(':')
		stamp_hr = time_parts[0]
		stamp_min = time_parts[1]
		stamp_sec = time_parts[2]

		t0 = datetime(int(current.year), 
					int(current.month),
					int(current.day),
					int(stamp_hr),
					int(stamp_min),
					int(stamp_sec))

		t1 = datetime(int(current.year),
					int(current.month),
					int(current.day),
					int(current.hour),
					int(current.minute),
					int(current.second))

		delta = t1-t0

		entry = entry + ' ' + str(delta)

	f.write(entry + '\n')
	f.close()
