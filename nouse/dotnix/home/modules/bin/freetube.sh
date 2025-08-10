#!/usr/bin/env bash

        cd  ~/.config/FreeTube/
        rsync history.db  ~/dotnix/home/modules/freetube/history.db
        rsync playlists.db  ~/dotnix/home/modules/freetube/playlists.db
        rsync profiles.db  ~/dotnix/home/modules/freetube/profiles.db
        rsync search-history.db  ~/dotnix/home/modules/freetube/search-history.db
        rsync settings.db  ~/dotnix/home/modules/freetube/settings.db
