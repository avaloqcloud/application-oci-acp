#!/bin/bash

# Read the new IP address from a variable
#new_ip="${acp_ip_address}"
new_ip=$(hostname -I | awk '{print $1}')

# File paths
listener_file_path="/var/opt/oracle/listener.ora"
tnsnames_file_path="/var/opt/oracle/tnsnames.ora"

# Escape periods in the IP address for sed
escaped_ip=$(echo "${new_ip}" | sed 's/\./\\./g')

# Replace the old IP address with the new one using sed
sed -i "s/\(HOST=\s*\)[0-9a-z\.]\+\(.*\)/\1${escaped_ip}\2/" "${listener_file_path}"
sed -i "s/\(Host\s*=\s*\)[0-9a-z\.]\+\(.*\)/\1${escaped_ip}\2/" "${tnsnames_file_path}"

# SID Name
sid_name=$(grep -E  -o "SID_NAME= [a-z0-9]+" "${listener_file_path}" | sed -r "s/SID_NAME= //")

su - oracle << RUN_AS_ORACLE
/home/oracle/aaa/bin/aaadb.ksh -s "${sid_name}" -c restart
/home/oracle/aaa/bin/aaadb.ksh -s "${sid_name}" -c start -o listener
RUN_AS_ORACLE

# Set the session level 5
su - oracle << RUN_AS_ORACLE
eval "$sid_name"
sqlplus "k/k@${sid_name}.avaloq" <<EOC
  exec k.base#.session_level(5);
  commit;
EOC
RUN_AS_ORACLE
