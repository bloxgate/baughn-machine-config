# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "rpool/nix";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/455E-0E2E";
      fsType = "vfat";
    };

  fileSystems."/home" =
    { device = "rpool/home";
      fsType = "zfs";
    };

  fileSystems."/home/svein/mnt" = {
    device = "svein@brage.info:";
    fsType = "fuse.sshfs";
    options = [
      "noauto" "x-systemd.automount" "_netdev" "users" "idmap=user"
      "IdentityFile=/home/svein/.ssh/id_ed25519"
      "allow_other" "default_permissions"
      "uid=1000" "gid=100"
      "reconnect" "ServerAliveInterval=15" "ServerAliveCountMax=3"
    ];
  };

  swapDevices = [ ];
}
