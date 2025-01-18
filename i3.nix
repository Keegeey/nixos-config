{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        i3 # i3
        i3status # i3 - stuff on taskbar
        alacritty # Terminal
        rofi # i3 - launcher
        feh # i3 - wallpaper
        polybar # i3 - taskbar
        picom # i3 - compositor? wtf is even that
        dunst # i3 - notifications
    ];

    services.xserver.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.windowManager.i3.enable = true;
}