# seastar-in-kvm
Create a VM for Seastar development environment

### Prerequire

Fedora 21
```
yum install @virtualization
systemctl enable libvirtd
systemctl start libvirtd
yum install libguestfs-tools-c virt-install
```

### How to build & run
```
./build.sh
./run.py -n -i ./seastar-dev.qcow2
(Try login as 'seastar' after firstboot.sh finished, Fedora will ask new password for the user)
```
