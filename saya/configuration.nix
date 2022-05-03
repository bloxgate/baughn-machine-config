# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ../modules
    ./hardware-configuration.nix
    ../modules/nvidia.nix
#    ../modules/amdgpu.nix
    ../modules/desktop.nix
#    ../modules/rsyncd.nix
#    ../modules/znapzend.nix
#    ../modules/monitoring.nix
  ];

  me = {
    virtualisation.enable = true;
  };

  services.flatpak.enable = true;

  ## Boot & hardware
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    default = "4";
    efiSupport = true;
    useOSProber = true;
    device = "nodev";
  };

  boot.kernelParams = [
    "boot.shell_on_fail"
  ];
  systemd.enableEmergencyMode = true;

  # Development
  nix.extraOptions = ''
    gc-keep-outputs = true
    gc-keep-derivations = true
  '';

  # Syncthing
  services.syncthing = {
    enable = true;
    user = "svein";
    configDir = "/home/svein/.config/syncthing";
    dataDir = "/home/svein/Sync";
  };

  ## Networking
  networking.hostName = "saya";
  systemd.network = {
    enable = true;
    links."00-internal" = {
      linkConfig.Name = "internal";
      linkConfig.WakeOnLan = "magic";
      matchConfig.MACAddress = "f0:2f:74:8c:54:2d";
    };
    networks."20-internal" = {
      matchConfig.Name = "internal";
      DHCP = "ipv4";
    };
  };

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

  users.include = [ "will" ];
}
