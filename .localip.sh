#!/bin/sh

ifconfig | awk '$1 == "inet" { print $2 }' | tail -1
