#!/usr/bin/env bash

echo "start sync"

rsync -a ~/vago/ /mnt/shared-data/vago/  --delete

echo "sync finished"

