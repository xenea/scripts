#!/bin/bash
###########################################################################################################
# Author:   xenea
# GitHub: https://github.com/xenea
#
# What For:
#   Check Exim queue
#	Execute clear queue command
#	Output before and after mail queue count
#
# Why:
#	Compromised web server, PHP script creating lots of spam mail in Exim,result's into consuming inode's. 
###########################################################################################################

#set path for current script
SHELL=/bin/sh PATH=/bin:/sbin:/usr/bin:/usr/sbin

#get current time
nw=$(date +%m-%d-%Y%t%T%p)

#ouput current queue message to file i.e. before executing mail clear command
echo "Current Exim Queue On :" >> /root/exim_queue_clear.log

echo "$nw" >> /root/exim_queue_clear.log

#command for queue check
exim -bpc >> /root/exim_queue_clear.log

#command for clearing the exim queue
exim -bp | exiqgrep -i | xargs exim -Mrm

#clear message on file
echo 'Queue cleared..!' >> /root/exim_queue_clear.log
echo 'Current Exim Queue :' >> /root/exim_queue_clear.log

#after clearing check queue count
exim -bpc >> /root/exim_queue_clear.log
echo '--------------------------------------------------' >> /root/exim_queue_clear.log
