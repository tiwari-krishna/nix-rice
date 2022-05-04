# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "ehci_pci" "ahci" "sd_mod" "sr_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/3ffe05f7-6514-4371-8781-a0734d328e45";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/23dcc1ce-5de6-4b26-b2ac-94d12ed1b1d2";
      fsType = "ext4";
    };

  fileSystems."/home/krishna/Data/Media" =
    { device = "/dev/disk/by-uuid/c316056c-0b8b-46e1-bc12-47fe40f30ebb";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/81f56c1b-8281-47d2-969b-f24b3c75511c"; }
    ];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}