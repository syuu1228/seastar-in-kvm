#!/bin/sh

virt-builder fedora-21 -o seastar-dev.qcow2 --format qcow2 --size 20G --hostname seastar-dev --install "@core" --update --selinux-relabel --firstboot scripts/bootstrap.sh
