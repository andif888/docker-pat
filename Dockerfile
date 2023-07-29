FROM ubuntu:jammy
LABEL maintainer="andif888"
ENV DEBIAN_FRONTEND noninteractive
ENV TF_VERSION 1.5.4
ENV PACKER_VERSION 1.9.2
ENV VAULT_VERSION 1.14.1

ENV pip_packages "ansible cryptography pywinrm kerberos requests_kerberos requests-credssp passlib PyVmomi pymssql"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-transport-https \
        gcc \
        ca-certificates \
        curl \
        git \
        gnupg \
        jq \
        krb5-user \
        krb5-config \
        libffi-dev \
        libkrb5-dev \
        libssl-dev \
        locales \
        lsb-release \
        mkisofs \
        openssh-client \
        python3-dev \
        python3-gssapi \
        python3-pip \
        python3-netaddr \
        python3-jmespath \
        python3-setuptools \
        python3-wheel \
        python3-pymssql \
        python3-hvac \
        sshpass \
        unzip \
    && rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN pip install --upgrade pip \
    && pip install $pip_packages \
    && ansible-galaxy collection install community.general community.hashi_vault

RUN curl -O https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip \
    && unzip terraform_${TF_VERSION}_linux_amd64.zip -d /usr/bin \
    && rm -f terraform_${TF_VERSION}_linux_amd64.zip \
    && chmod +x /usr/bin/terraform \
    && curl -O https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
    && unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/bin \
    && rm -f packer_${PACKER_VERSION}_linux_amd64.zip \
    && chmod +x /usr/bin/packer \
    && packer plugins install github.com/ethanmdavidson/git \
    && packer plugins install github.com/hashicorp/ansible \
    && packer plugins install github.com/hashicorp/vsphere \
    && packer plugins install github.com/rgl/windows-update \
    && curl -O https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
    && unzip vault_${VAULT_VERSION}_linux_amd64.zip -d /usr/bin \
    && rm -f vault_${VAULT_VERSION}_linux_amd64.zip \
    && chmod +x /usr/bin/vault \
    && curl -O https://vdc-download.vmware.com/vmwb-repository/dcr-public/2ee5a010-babf-450b-ab53-fb2fa4de79af/2a136212-2f83-4f5d-a419-232f34dc08cf/VMware-ovftool-4.4.3-18663434-lin.x86_64.zip \
    && unzip VMware-ovftool-4.4.3-18663434-lin.x86_64.zip -d /opt \
    && rm -f VMware-ovftool-4.4.3-18663434-lin.x86_64.zip \
    && ln -s /opt/ovftool/ovftool /usr/bin/ovftool

CMD    ["/bin/bash"]
