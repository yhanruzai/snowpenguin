{ config, lib, pkgs, ... }:
{

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    open = false; # Disabled to allow use of the (better) proprietary drivers.
 
    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management
    powerManagement.enable = true;
    powerManagement.finegrained = true;

    # Enable the Nvidia Stable branch.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

    hardware.nvidia.prime = {
    	# Make sure to use the correct Bus ID values for your system!
    	amdgpuBusId = "PCI:74:0:0";
    	nvidiaBusId = "PCI:1:0:0";
    	offload = {
    	  enable = true;
    	  enableOffloadCmd = true;
    	};
    }; 

} 
