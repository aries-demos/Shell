#!/bin/bash
clear
if [[ $# -eq 0 ]]
then
# Define Variable reset_terminal
reset_terminal=$(tput sgr0)

# Check OS Type
	os=$(uname -o)
	echo -e '\E[32m'"Operator System Type :" $reset_terminal $os
# Check OS Release Version and Name
	os_name=$(cat /etc/os-release* | grep NAME)
	echo -e '\E[32m'"Operator System TypeCheck OS Release Version and Name:\n" $reset_terminal $os_name
# Check Architecture
	architecture=$(uname -m)
	echo -e '\E[32m'"Check Architecture:" $reset_terminal $architecture
# Check Kernel Release
	kernerrelease=$(uname -r)
	echo -e '\E[32m'"Check Kernel Release:" $reset_terminal $kernerrelease
# Check hostname echo HOSTNAME
	hostname=$(uname -n)
	echo -e '\E[32m'"Check Hostname:" $reset_terminal $hostname
# CHeck Internal IP
	interalip=$(hostname -I)
	echo -e '\E[32m'"Check InternalIP:" $reset_terminal $interalip
# Check External IP
	externalip=$(curl -s http://ipecho.net/plain)
	echo -e '\E[32m'"Check ExternalIP:" $reset_terminal $externalip
# Check DNS
	nameserver=$(cat /etc/resolv.conf | grep -E "\<nameserver[ ]+" | awk '{print $NF}')
	echo -e '\E[32m'"Check DNS:" $reset_terminal $nameserver
# Check if connected to Internet or not
	ping -c 2 www.baidu.com &>/dev/null && 
	echo "  Internet:Connected" || echo "  Internet:Disconnected"
# Check Logged In Users
	who>/tmp/who
	echo -e '\E[32m' "Logged In Users" $reset_terminal && cat /tmp/who
	rm -f /tmp/who

##########################################################
	system_mem_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}END{print (total-free)/1024}' /proc/meminfo)
	echo -e '\E[32m'" system memuserages " $reset_terminal $system_mem_usages
	apps_mem_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}/^Cached/{cached=$2}/Buffers/{buffers=$2}END{print (total-free-cached-buffers)/1024}' /proc/meminfo)
	echo -e '\E[32m'" apps memuserages " $reset_terminal $apps_mem_usages

	loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
	echo -e '\E[32m'" load averages " $reset_terminal $loadaverage

	#diskavege=$(df -hP|grep -vE 'Filesystem|tmpfs' | awk '{print $1 " " $5}')
	df -hP|grep -vE 'tmpfs' >/tmp/diskavege
	echo -e '\E[32m'" disk averages " $reset_terminal && cat /tmp/diskavege
	rm -f /tmp/diskavege
fi
