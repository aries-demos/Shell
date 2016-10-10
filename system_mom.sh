#!/bin/bash
clear
if [[ $# -eq 0 ]]
then
# Define Variable reset_terminal
reset_teminal=$(tput sgr0)

# Check OS Type
	os=$(uname -o)
	echo -e '\E[32m'"Operator System Type :" $reset_terminal $os
# Check OS Release Version and Name
	os_name=$(cat /etc/issue|grep -e "Server")
	echo -e '\E[32m'"Operator System TypeCheck OS Release Version and Name:" $reset_terminal $os_name
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
	ping -c 2 www.baidu.com &>/dev/null && echo "Internet:Connected" || echo "Internet:Disconnected"
# Check Logged In Users
	who>/tmp/who
	echo -e '\E[32m' "Logged In Users" && cat /tmp/who
	rm -f /tmp/who
fi
