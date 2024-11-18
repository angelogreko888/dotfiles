#!/usr/bin/env bash

sleep 1

rm -rf ~/.cache/* 

sleep 1

~/bin/bup &

sleep 1

exit
