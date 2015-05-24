# seastar-in-kvm
Create a VM for Seastar development environment

# Why we need this
SeaStar scores muximum performance with DPDK, but it cannot live with existing NIC driver/Linux kernel network stack.
Also it directly accesses NIC device, it's bit hard to try it on remote node.

seastar-in-kvm offers Fedora VM with SeaStar + DPDK without setup, it's easiest way to begin SeaStar application development.

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

### Usage of the container
```
source /etc/profile.d/rvm.sh # For OSv/Ruby
rvm use 2.2.0                # For OSv/Ruby

cd /root/osv
ls apps # choose your favorite app
./scripts/build image=tomcat,httpserver # pass app name following "image="
                                        # Multiple apps can specify by using camma,
                                        # "httpserver" is system module that provides REST api and Web interface.
./scripts/run.py -n # run built VM image on KVM
```

