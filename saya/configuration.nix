# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ../modules
    ./hardware-configuration.nix
    ../modules/emergency-shell.nix
    ../modules/nvidia.nix
#    ../modules/amdgpu.nix
#    ../modules/rsyncd.nix
#    ../modules/znapzend.nix
#    ../modules/monitoring.nix
  ];

  me = {
    desktop.enable = true;
    virtualisation.enable = true;
    propagateNix = false;
  };

  environment.etc."egl/egl_external_platform.d/nvidia_wayland.json".text = ''
  {
    "file_format_version" : "1.0.0",
    "ICD" : {
        "library_path" : "/run/opengl-driver/lib/libnvidia-egl-wayland.so"
    }
  }
  '';


  ## Boot & hardware
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    default = "saved";
    efiSupport = true;
    useOSProber = true;
    device = "nodev";
  };
  boot.kernelParams = [
    "boot.shell_on_fail"
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxPackages_zen;
  systemd.enableEmergencyMode = true;
  #powerManagement.cpuFreqGovernor = "ondemand";

  # Development
  nix.extraOptions = ''
    gc-keep-outputs = true
    gc-keep-derivations = true
  '';

  ## Networking
  networking.hostName = "saya";
  networking.hostId = "deafbeef";
  networking.useDHCP = false;
  networking.networkmanager.enable = true;

  networking.firewall = {
    allowedTCPPorts = [ 
      6987   # rtorrent
    ];
    allowedUDPPorts = [
      6987   # rtorrent
      34197  # factorio
      10401  # Wireguard
    ];
  };

  # Wireguard link between my machines
  networking.wireguard = {
    interfaces.wg0 = {
      ips = [ "10.40.0.3/24" ];
      peers = [
        # Tsugumi
        {
          allowedIPs = [ "10.40.0.1/32" ];
          endpoint = "10.19.2.2:10401";
          persistentKeepalive = 30;
          publicKey = "H70HeHNGcA5HHhL2vMetsVj5CP7M3Pd/uI8yKDHN/hM=";
        }
      ];
      privateKeyFile = "/secrets/wg.key";
    };
  };

  users.include = [ "will" ];
}
