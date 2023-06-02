packer {
  required_plugins {
    proxmox = {
      version = ">= 1.1.2"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

source "proxmox-clone" "git" {
    # ID
    task_timeout = "15m"
    # Enter name of template in clone_vm
    clone_vm = ""
    # Change proxmox_url with your proxmox_url
    proxmox_url = "https://192.168.0.1:8006/api2/json"
    # Replace username of Proxmox
      # Form : username@[pve/pam]![token_name]
    username = "nonnetrapue@pve!packer"
    token = ""
    # In node, write Proxmox server name
    node = ""
    cores = 2
    sockets = 2
    cpu_type = "host"
    memory = 2048 
    insecure_skip_tls_verify = true	
    # Base ISO File configuration
    # System
      # Change vm_name with vm target 
    vm_name  = "Rocky" 
      # Change vm_id with vm_id target. Without write vm_id, vm_id will be random
    vm_id  = ""
    scsi_controller = "virtio-scsi-single"
    # Replace ssh_password and ssh_username with root account of VM
    ssh_password         = ""
    ssh_timeout          = "20m"
    ssh_username         = ""
    
    
    }

build {
    // Load iso configuration
   sources = ["source.proxmox-clone.git"]
   
   provisioner "shell" {
    # In inline, enter few of linux commands 
    inline = [
    ""
    ]
  }
}


