#!/usr/bin/env bash

echo "
[zram0]
zram-size = min(ram / 2, 4096)
compression-algorithm = zstd
" | sudo tee /etc/systemd/zram-generator.conf

echo "Done!"
