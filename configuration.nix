{ config, pkgs, ... }:

{
  imports = [
    # ./hyprland.nix
    ./i3.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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
    stow
    gcc
    gnumake
    cmake
    meson
    python3
    xfce.thunar
    xfce.thunar-archive-plugin
    vscode
    obsidian
    fastfetch
    mullvad-vpn
    spotify
    discord
    virt-manager
    lxappearance # idk
    wget # idk
    qimgv
    samba
    gnome-themes-extra  # Includes the Adwaita theme
    godot_4

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
  
  # Special icons for terminal theme
  fonts.packages = with pkgs; [
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];

  environment.variables = {
    TERMINAL = "alacritty";
    GTK_THEME = "Adwaita:dark";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
