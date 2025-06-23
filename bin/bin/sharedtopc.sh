#!/usr/bin/env bash

echo "start sync"

rsync -a /mnt/shared-data/vago/ ~/vago/ --delete

echo "sync finished"

