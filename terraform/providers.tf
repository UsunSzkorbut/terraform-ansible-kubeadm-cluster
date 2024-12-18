terraform {
    required_version = ">= 0.14"
    required_providers {
      proxmox = {
        source = "Telmate/proxmox"
        version = "3.0.1-rc3"
      }
    }
  }

  provider "proxmox" {
      pm_tls_insecure = true
      pm_api_url = "https://10.75.168.99:8006/api2/json"
      pm_api_token_secret = "ef058ed0-f6fd-4c37-94c7-a29fdd32d389"
      pm_api_token_id = "root@pam!terraform"
  }
