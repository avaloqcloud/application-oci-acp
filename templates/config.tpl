#!/bin/bash

# Read the new IP address from a variable
new_ip="${acp_ip_address}"

# File path
file_path="/var/opt/oracle/listener.ora"

# Escape periods in the IP address for sed
escaped_ip=$(echo "$new_ip" | sed 's/\./\\./g')

# Replace the old IP address with the new one using sed
sed -i "s/\(HOST=\s*\)[0-9\.]\+\(.*\)/\1$escaped_ip\2/" "$file_path"


