terraform {
  required_providers {

    local = {
      source = "hashicorp/local"
      version = ">=2.4.0"
    }
    null = {
      source = "hashicorp/null"
      version = ">=3.2.1"
    }
    tls = {
      source = "hashicorp/tls"
      version = ">=4.0.4"
    }
    vault = {
      source = "hashicorp/vault"
      version = ">=3.22.0"
    }
    vsphere = {
      source = "hashicorp/vsphere"
      version = ">=2.5.1"
    }
  }
  required_version = ">=1.5.4"
}
