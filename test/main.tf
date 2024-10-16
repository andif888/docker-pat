terraform {
  required_providers {

    local = {
      source = "hashicorp/local"
      version = ">=2.5.1"
    }
    null = {
      source = "hashicorp/null"
      version = ">=3.2.2"
    }
    tls = {
      source = "hashicorp/tls"
      version = ">=4.0.5"
    }
    vault = {
      source = "hashicorp/vault"
      version = ">=3.25.0"
    }
    vsphere = {
      source = "hashicorp/vsphere"
      version = ">=2.7.0"
    }
    citrix = {
      source = "citrix/citrix"
      version = "1.0.4-wem-preview-2"
    }
  }
  required_version = ">=1.7.4"
}
