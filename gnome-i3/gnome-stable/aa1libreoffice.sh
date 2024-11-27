#!/bin/bash
 
  handle_error() {
        echo "An error occurred on line $1"
        exit 1
    }
   
    trap 'handle_error $LINENO' ERR

mkdir -p /home/vago/git/lo

cd /home/vago/git/lo/

wget https://download.documentfoundation.org/libreoffice/stable/24.2.4/deb/x86_64/LibreOffice_24.2.4_Linux_x86-64_deb.tar.gz

tar -xvzf LibreOffice_24.2.4_Linux_x86-64_deb.tar.gz

cd /home/vago/git/lo/LibreOffice_24.2.4.2_Linux_x86-64_deb/DEBS/

rm libreoffice24.2-dict-fr_24.2.4.2-2_amd64.deb

rm libreoffice24.2-dict-es_24.2.4.2-2_amd64.deb

sudo dpkg -i *.deb

sudo apt-get install libreoffice-java-common -y




