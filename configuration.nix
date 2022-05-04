{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  # networking.useDHCP = false;
  # networking.interfaces.enp0s3.useDHCP = true;

  networking.hostName = "calc"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable kde plasma desktop environment
  # services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.startx.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.windowManager.awesome.enable = true;
  services.xserver.autorun = false;
  services.xserver.videoDrivers = [ "intel" ];

  # Configure keymap in X11
  services.xserver.layout = "us";
  #services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.krishna = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "storage" "disk" "input" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  nixpkgs.config.allowUnfree = true;
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     vim neovim links2 emacs mpd mpc_cli mpv ncmpcpp zathura youtube-dl sxiv xwallpaper xorg.xmodmap psmisc xorg.xinit xorg.xev xcompmgr xorg.xsetroot xorg.xmessage xorg.xbacklight xclip ranger ueberzug xfce.thunar fira fira-mono fira-code fira-code-symbols hack-font noto-fonts noto-fonts-emoji noto-fonts-extra clipgrab minitube pandoc starship pavucontrol pulsemixer pamixer qt5ct lxappearance papirus-icon-theme neofetch gimp pinta gcc xorg.utilmacros bash-completion dash liberation_ttf roboto roboto-mono roboto-slab dmenu st alacritty rofi rofi-emoji qbittorrent texlive.combined.scheme-basic emacs27Packages.all-the-icons htop gotop figlet unrar unzip zip scid haskellPackages.pandoc-crossref bibata-cursors libsForQt5.breeze-gtk imagemagick ffmpeg groff fuse fuse-common fuse3 
     wget curl git dunst libvterm xorg.xorgserver xorg.xf86inputsynaptics xorg.xf86inputlibinput xorg.xf86inputevdev xorg.xf86videointel
     brave qutebrowser firefox google-fonts geany haskellPackages.xmonad haskellPackages.xmonad-dbus haskellPackages.xmonad-utils haskellPackages.xmonad-contrib haskellPackages.xmobar
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}
