#!/bin/sh -e
nmcli c modify eth0 ipv4.ignore-auto-dns "yes"
systemctl restart network
echo nameserver 8.8.8.8 > /etc/resolv.conf
useradd -m -p "" -g wheel seastar
chage -d 0 seastar
yum install -y gcc gcc-c++ libaio-devel ninja-build ragel hwloc-devel numactl-devel libpciaccess-devel cryptopp-devel xen-devel boost-devel kernel-devel libxml2-devel zlib-devel libasan libubsan git wget python3 tar
cd /root
wget http://dpdk.org/browse/dpdk/snapshot/dpdk-2.0.0.tar.gz
tar -xpf dpdk-2.0.0.tar.gz
mv dpdk-2.0.0 dpdk
cd dpdk
cat config/common_linuxapp | sed -e "s/CONFIG_RTE_MBUF_REFCNT_ATOMIC=y/CONFIG_RTE_MBUF_REFCNT_ATOMIC=n/g" | sed -e "s/CONFIG_RTE_LIBRTE_PMD_BOND=y/CONFIG_RTE_LIBRTE_PMD_BOND=n/g" | sed -e "s/CONFIG_RTE_LIBRTE_IP_FRAG=y/CONFIG_RTE_LIBRTE_IP_FRAG=n/g" > /tmp/common_linuxapp
mv /tmp/common_linuxapp config
make T=x86_64-native-linuxapp-gcc install
cd -
git clone https://github.com/cloudius-systems/seastar.git
cd seastar
./configure.py --dpdk-target ~/dpdk/x86_64-native-linuxapp-gcc --disable-xen
ninja-build -j2
