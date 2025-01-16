# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      # ./hyprland.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "gg-nixos";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable SSH
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password";
    };
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.grant = {
    isNormalUser = true;
    description = "Grant";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "grant";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # text editor
    neovim # better text editor
    wget
    i3 # i3
    i3status # i3 - stuff on taskbar
    rofi # i3 - launcher
    feh # i3 - wallpaper
    polybar # i3 - taskbar
    picom # i3 - compositor? wtf is even that
    dunst # i3 - notifications
    stow # dotfile symlinks
    firefox # browser i hardly know er
    vscode # ide
    obsidian # notes
    gcc # gnu compiler collection
    # nerd-fonts.fira-code
    # mullvad-vpn
    # sassc
    # conky
    # xfce.xfce4-settings
    # adw-gtk3
    # brillo
    # p7zip
    # protontricks
    # gnome.zenity
    xfce.thunar # file explorer
    xfce.thunar-archive-plugin
    # nwg-look
    # gnome.gnome-boxes
    # vinegar
    # xarchive
    # xarchiver
    # pavucontrol
    # libsForQt5.dolphin
    # libsForQt5.qtstyleplugin-kvantum # Hyprland?
    # hyprpaper # Very Hyprland
    # pywal # Hyprland
    lxappearance # Hyprland
    # pamixer # Hyprland
    # wofi # Hyprland
    # kitty # Hyprland
    # waybar # Hyprland
    # gnome.gnome-disk-utility
    # networkmanagerapplet
    # gnome.gnome-software
    # wine-staging
    # flameshot # Hyprland
    # gnome.gnome-tweaks
    # wine # Wine Staging better cuz 9.0
    # python311Packages.pip
    alacritty # Terminal
    # cliphist # Hyprland
    # zathura # Hyprland
    # rofi-wayland #Hyprland
    # swaylock-effects # Hyprland
    fastfetch # showoff
    # micro
    # steamtinkerlaunch
    # heroic
    # lutris
    # gedit
    # gnome.gnome-terminal
    git # version control
    cmake
    meson
    # vim-full
    gnumake
    # starship
    # gamemode
    # eww # Hyprland
    # mangohud
    # gradience
    # latte-dock
    python3
  ];
  
  fonts.packages = with pkgs; [
    # nerd-fonts.fira-code
  ];

  environment.variables = {
    TERMINAL = "alacritty";
  };

  # programs.hyprland.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # i3 stuff
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable = true;
  
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
