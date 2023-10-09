#!/bin/bash

# Read the new IP address from a variable
#new_ip="${acp_ip_address}"
new_ip=$(hostname -I | awk '{print $1}')

# File path
file_path="/var/opt/oracle/listener.ora"

# Escape periods in the IP address for sed
escaped_ip=$(echo "$new_ip" | sed 's/\./\\./g')

# Replace the old IP address with the new one using sed
sed -i "s/\(HOST=\s*\)[0-9a-z\.]\+\(.*\)/\1$escaped_ip\2/" "$file_path"

# SID Name
sid_name=$(grep -E  -o "SID_NAME= [a-z0-9]+" /var/opt/oracle/listener.ora  | sed -r "s/SID_NAME= //")

su - oracle << RUN_AS_ORACLE
/home/oracle/aaa/bin/aaadb.ksh -s "${sid_name}" -c restart
/home/oracle/aaa/bin/aaadb.ksh -s "${sid_name}" -c start -o listener
RUN_AS_ORACLE
