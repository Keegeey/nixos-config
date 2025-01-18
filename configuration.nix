# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
    firefox
    git
    vim
    neovim
    i3 # i3
    i3status # i3 - stuff on taskbar
    alacritty # Terminal
    rofi # i3 - launcher
    feh # i3 - wallpaper
    polybar # i3 - taskbar
    picom # i3 - compositor? wtf is even that
    dunst # i3 - notifications
    stow # dotfile symlinks
    gcc
    gnumake
    cmake
    meson
    python3
    xfce.thunar # file explorer
    xfce.thunar-archive-plugin
    vscode
    obsidian
    fastfetch

    lxappearance # idk
    wget # idk
    
    # mullvad-vpn

    # TODO: Google these
    # sassc
    # conky
    # adw-gtk3
    # brillo
    # p7zip
    # protontricks
    # gnome.zenity
    # nwg-look
    # vinegar
    # xarchive
    # xarchiver
    # pavucontrol

    # wine # Wine Staging better cuz 9.0
    # wine-staging

    # Hyprland
    # libsForQt5.dolphin
    # libsForQt5.qtstyleplugin-kvantum # Hyprland?
    # hyprpaper # Very Hyprland
    # pywal # Hyprland
    # pamixer # Hyprland
    # wofi # Hyprland
    # kitty # Hyprland
    # waybar # Hyprland
    # flameshot # Hyprland
    # cliphist # Hyprland
    # zathura # Hyprland
    # rofi-wayland #Hyprland
    # swaylock-effects # Hyprland
    # eww # Hyprland

    # gnome.gnome-boxes
    # gnome.gnome-disk-utility
    # gnome.gnome-terminal
    # gnome.gnome-tweaks
    # python311Packages.pip
    # networkmanagerapplet
    # gnome.gnome-software
    # micro
    # steamtinkerlaunch
    # heroic
    # lutris
    # gedit
    # vim-full
    # starship
    # gamemode
    # mangohud
    # gradience
    # latte-dock
  ];
  
  fonts.packages = with pkgs; [
    # nerd-fonts.fira-code
    # nerd-fonts-meslo-lg
  ];

  environment.variables = {
    TERMINAL = "alacritty";
  };

  # TODO: Maybe later
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
