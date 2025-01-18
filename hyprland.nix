{ config, pkgs, ... }:

{
    # TODO: Probably missing some things
    environment.systemPackages = with pkgs; [
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
    ];

    programs.hyprland.enable = true;
}