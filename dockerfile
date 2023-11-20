FROM debian:bookworm-slim
RUN apt update \
    && apt install -y openvswitch-switch openvswitch-common
ENTRYPOINT [ "/bin/bash"]