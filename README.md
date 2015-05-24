# seastar-in-kvm
Create a VM for Seastar development environment

### Prerequire

On Fedora 21:
```
yum install @virtualization
systemctl enable libvirtd
systemctl start libvirtd
yum install libguestfs-tools-c virt-install
```

### How to build & run
```
./build.sh
./register.sh
virsh start seastar-dev && virsh console seastar-dev
(Try login as 'seastar' after firstboot.sh finished, Fedora will ask new password for the user)
```
