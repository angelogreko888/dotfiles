#!/bin/bash

cd ~

if grep -q '^input:' /etc/group; then
	echo "'input' group exists."
else
        echo "'input' group doesn't exist. Creating 'input' group..."
        sudo groupadd input
        echo "'input' group created" 
fi

sudo usermod -aG input "$(whoami)"
        echo "User added to the 'input' group. Changes will take effect after you log out and log back in."

