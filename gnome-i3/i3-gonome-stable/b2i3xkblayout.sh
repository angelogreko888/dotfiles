 #!/bin/bash

 handle_error() {
       echo "An error occurred on line $1"
       exit 1
   }
  
   trap 'handle_error $LINENO' ERR

cd /home/vago/git

git clone https://github.com/nonpop/xkblayout-state.git

cd xkblayout-state

make

sudo cp xkblayout-state /usr/local/bin/


