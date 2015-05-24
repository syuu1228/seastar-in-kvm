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

