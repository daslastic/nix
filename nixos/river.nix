{ config, pkgs, ... }:

let
  dbus-river-environment = pkgs.writeTextFile {
    name = "dbus-river-environment";
    destination = "/bin/dbus-river-environment";
    executable = true;

    text = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=river
    '';
  };

  configure-gtk = pkgs.writeTextFile {
    name = "configure-gtk";
    destination = "/bin/configure-gtk";
    executable = true;
    text =
      let
        schema = pkgs.gsettings-desktop-schemas;
        datadir = "${schema}/share/gsettings-schemas/${schema.name}";
      in
      ''
        export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
        gnome_schema=org.gnome.desktop.interface
        gsettings set $gnome_schema color-scheme 'prefer-dark'
        gsettings set $gnome_schema gtk-theme 'Adwaita-dark'
        gsettings set $gnome_schema cursor-theme 'Adwaita'
        gsettings set org.gnome.desktop.wm.preferences button-layout ""
        gsettings set org.gnome.desktop.interface monospace-font-space "Monospace 16"
        gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
      '';
  };
in
{
  environment = {
    systemPackages = with pkgs; [
      dbus-river-environment
      gsettings-desktop-schemas
      configure-gtk
      wdisplays
      wayland
      xwayland
      river
      brightnessctl
      waybar
      gammastep
      foot
      tofi
      grim
      slurp
      sway-contrib.grimshot
      glib
      imv
      nsxiv
      wl-clipboard
      showmethekey
      wtype
      swaybg
      sway
      wob
      wlclock
    ];
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };

  programs = {
    xwayland.enable = true;
    river.enable = true;
  };
}
