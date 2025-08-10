#!/bin/bash

sudo xbps-install -S flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.anydesk.Anydesk
flatpak install flathub io.freetubeapp.FreeTube
flatpak install flathub io.gitlab.librewolf-community

