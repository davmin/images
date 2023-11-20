FROM debian:bookworm-slim
RUN apt update \
    && apt install -y openvswitch-switch openvswitch-common
ENTRYPOINT [ "ovs-vswitchd && /bin/bash"]