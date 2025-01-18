{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        i3 # Window manager
        i3status # Taskbar status info
        alacritty # Terminal
        rofi # Program launcher
        feh # Wallpaper setter
        polybar # Taskbar
        picom # Compositor
        dunst # Notifications
    ];

    services.xserver.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.windowManager.i3.enable = true;
}