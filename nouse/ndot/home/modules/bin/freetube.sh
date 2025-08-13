#!/usr/bin/env bash

        cd  ~/.config/FreeTube/
        rsync history.db  ~/ndot/home/modules/freetube/history.db
        rsync playlists.db  ~/ndot/home/modules/freetube/playlists.db
        rsync profiles.db  ~/ndot/home/modules/freetube/profiles.db
        rsync search-history.db  ~/ndot/home/modules/freetube/search-history.db
        rsync settings.db  ~/ndot/home/modules/freetube/settings.db
