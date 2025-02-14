FROM rockylinux:9

# Definir variáveis para reutilização
ENV LICENSE_FILE=ACD2025enlicense.lic
ENV FLEXNET_USER=flexnet

# Instalar dependências e criar link simbólico
RUN ln -s /lib64/ld-linux-x86-64.so.2 /lib64/ld-lsb-x86-64.so.3 && \
    dnf install -y sudo && \
    dnf clean all

# Copiar e instalar o software
COPY ./.Podman/nlm11.19.4.1_ipv4_ipv6_linux64.rpm /tmp/
RUN dnf install -y /tmp/nlm11.19.4.1_ipv4_ipv6_linux64.rpm && \
    rm -f /tmp/nlm11.19.4.1_ipv4_ipv6_linux64.rpm && \
    dnf clean all

# Criar usuário e diretório de licenças
RUN useradd -r -s /bin/sh -m -d /home/$FLEXNET_USER $FLEXNET_USER && \
    echo "$FLEXNET_USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    mkdir -p /opt/flexnetserver/licenses && \
    chown -R $FLEXNET_USER:$FLEXNET_USER /opt/flexnetserver

# Mudar para usuário flexnet e definir diretório de trabalho
USER $FLEXNET_USER
WORKDIR /home/$FLEXNET_USER

# Copiar a licença como usuário flexnet
COPY ./.Podman/$LICENSE_FILE /opt/flexnetserver/licenses/

# Definir entrada do contêiner
ENTRYPOINT ["/opt/flexnetserver/lmgrd", "-c", "/opt/flexnetserver/licenses/ACD2025enlicense.lic", "-l", "/opt/flexnetserver/flexnetserver.log", "-z"]
