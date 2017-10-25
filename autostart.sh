#!/bin/bash
set -o xtrace # show commands

PS1='\e]2;[\u@\h]\a[\e[32;1m\t\e[0m] ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]> '