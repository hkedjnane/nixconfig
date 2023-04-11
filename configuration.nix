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
     ./list_packages.nix
     #Surface hardware optimization, change path/remove on different system
     <nixos-hardware/microsoft/surface/surface-pro-intel>
   ];

  # Set kernel for Surface
  microsoft-surface.kernelVersion = "6.1.18";

  # Bootloader.
  boot.supportedFilesystems = [ "ntfs" ];
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub = {
    enable = true;
    devices = [ "nodev" ];
    efiSupport = true;
    useOSProber = true;  
  };

  # Clean up after yourself..
  nix.gc.automatic = true;
  nix.gc.dates = "03:14";
  nix.gc.options = "--delete-older-than 30d";

  networking.hostName = "nixsurface"; # Define your hostname.



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
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "docker"];
    packages = with pkgs; [];
  };

  # Add trusted users
  nix.settings.trusted-users = [ "root" "harsane" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  # System services
  services = {
    # OpenSSH daemon
    openssh.enable = true;
    # Gnome keyring
    gnome.gnome-keyring.enable = true;

    # Enable ACPID
    acpid.enable = true;
  };
  
  # Add and enable gnome-keyring
  security.pam.services.lightdm.enableGnomeKeyring = true;

  hardware = {
    # Enable audio
    pulseaudio.enable = true;
    pulseaudio.extraConfig = ''
      load-module module-switch-on-connect
      '';
    
    # Enable bluetooth
    bluetooth.enable = true;
    
    # Enable HiDPI support
    video.hidpi.enable = true;
  };

  # Enable docker
  virtualisation.docker.enable = true;

  # Enabling experimental features by default
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
      auto-optimise-store = true
      binary-caches = https://cache.nixos.org https://hydra.nixos.org http://hydra.cryp.to
      trusted-binary-caches = https://cache.nixos.org https://hydra.nixos.org http://hydra.cryp.to
    '';
  };

  # Enable light, a backlight manager
  programs.light.enable = true;

  # Enable SSH agent
  programs.ssh.startAgent = true;



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
