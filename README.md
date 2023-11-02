# docker-pat

Docker Image containing:

- packer
  - plugin: github.com/ethanmdavidson/git
  - plugin: github.com/hashicorp/ansible
  - plugin: github.com/hashicorp/vsphere
  - plugin: github.com/rgl/windows-update
- ansible
- terraform
  - provider: local
  - provider: null
  - provider: tls
  - provider: vault
  - provider: vsphere
- vault

[https://hub.docker.com/r/andif888/docker-pat](https://hub.docker.com/r/andif888/docker-pat)
