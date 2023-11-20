FROM almalinux/9-minimal:latest

RUN microdnf install -y python3 automake autoconf libtool libbpf libxdp git &&\
    git clone https://github.com/openvswitch/ovs.git &&\
    cd ovs &&\
    ./boot.sh && ./configure --enable-afxdp &&\
    make && make install &&\
    ldd vswitchd/ovs-vswitchd &&\
    ovs-vswitchd &&\
    ovs-vsctl -- add-br br0 -- set Bridge br0 datapath_type=netdev
    
RUN ["/bin/sh"]