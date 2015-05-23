# seastar-vm
Create a VM for Seastar development environment

### Prerequire

Fedora 21
```
yum install @virtualization
yum install libguestfs-tools-c
```

### Usage
```
./build.sh
./run.py -n -i ./seastar-dev.qcow2
(Try login as 'seastar' after firstboot.sh finished, Fedora will ask new password for the user)
```
