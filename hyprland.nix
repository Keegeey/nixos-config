{ config, pkgs, ... }:

{
    # TODO: Probably missing some things
    environment.systemPackages = with pkgs; [
        hyprland
        libsForQt5.dolphin
        libsForQt5.qtstyleplugin-kvantum # Hyprland?
        hyprpaper # Very Hyprland
        pywal # Hyprland
        pamixer # Hyprland
        wofi # Hyprland
        kitty # Hyprland
        waybar # Hyprland
        flameshot # Hyprland
        cliphist # Hyprland
        zathura # Hyprland
        rofi-wayland #Hyprland
        swaylock-effects # Hyprland
        eww # Hyprland
        alacritty
        rofi
    ];

    programs.hyprland.enable = true;
}
