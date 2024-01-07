# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

 # Changing the nix configuration path to local one for easier perms management
 

  imports =
    [ # Include the results of the hardware scan.
     ./hardware-configuration.nix
     ./default/system.nix
     #Surface hardware optimization, change path/remove on different system
     <nixos-hardware/lenovo/thinkpad/t14/amd/gen3>
   ];

  # Bootloader.
  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader.efi.canTouchEfiVariables = true;
    loader.efi.efiSysMountPoint = "/boot";
    loader.grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;  
    };

    consoleLogLevel = 0;
    kernelParams = [ "quiet" "udev.log_level=0" ];
  };


  networking.hostName = "nixpad"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure X11 server
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.harsane = {
    isNormalUser = true;
    description = "Harrys Kedjnane";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "docker" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "harsane";

  # Enable docker
  virtualisation.docker.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  security.polkit.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
