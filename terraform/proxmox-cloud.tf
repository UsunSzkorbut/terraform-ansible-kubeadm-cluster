resource "proxmox_vm_qemu" "kubeadm-master" {
    target_node = "proxn1"
    desc = "Cloud Ubuntu 24.04"
    count = 1
    onboot = true

    clone = "ubuntu-cloud-2404"
    agent = 0

    os_type = "cloud-init"
    cores = 2
    sockets = 1
    vcpus = 0
    cpu = "host"
    memory = 8192
    name = "k8s-cp-0${count.index + 1}"

    scsihw   = "virtio-scsi-single"
    bootdisk = "scsi0"
    disks {
        scsi {
            scsi0 {
                disk {
                  storage = "local-lvm"
                  emulatessd = true
                  size = 100
                }
            }
            scsi1 {
                disk {
                  storage = "local-lvm"
                  emulatessd = true
                  size = 50
                  format = "raw"
                }
            }
        }
        ide {
            ide3 {
                cloudinit {
                  storage = "local-lvm"
                }
            }
        }
    }

    network {
        model = "virtio"
        bridge = "vmbr0"
    }
    ipconfig0 = "ip=10.75.168.1${count.index + 1}/24,gw=10.75.168.1"
}

resource "proxmox_vm_qemu" "kubeadm-worker" {
    target_node = "proxn1"
    desc = "Cloud Ubuntu 22.04"
    count = 1
    onboot = true

    clone = "ubuntu-cloud-2404"
    agent = 0

    os_type = "cloud-init"
    cores = 2
    sockets = 1
    vcpus = 0
    cpu = "host"
    memory = 8192
    name = "k8s-worker-0${count.index + 1}"

    scsihw   = "virtio-scsi-single"
    bootdisk = "scsi0"
    disks {
        scsi {
            scsi0 {
                disk {
                  storage = "local-lvm"
                  emulatessd = true
                  size = 100
                }
            }
            scsi1 {
                disk {
                  storage = "local-lvm"
                  emulatessd = true
                  size = 50
                  format = "raw"
                }
            }
        }
        ide {
            ide3 {
                cloudinit {
                  storage = "local-lvm"
                }
            }
        }
    }

    network {
        model = "virtio"
        bridge = "vmbr0"
    }
    ipconfig0 = "ip=10.75.168.2${count.index + 1}/24,gw=10.75.168.1"
}