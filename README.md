# bluefin

A clone of [ublue-os bluefin](https://github.com/ublue-os/bluefin), slightly adapted for me. All credit goes to the [Project Bluefin team](https://projectbluefin.io/) and contributors - my hat's off to you!

[![bluefin 39](https://github.com/hirnidrin/bluefin/actions/workflows/build-39-bluefin.yml/badge.svg)](https://github.com/hirnidrin/bluefin/actions/workflows/build-39-bluefin.yml)

## Notes

1. I only build the `bluefin` and `bluefin-dx` brands, version Fedora 39, for the `main` flavor (generic hardware with Intel or AMD GPU).
1. This repo holds the full code for all brands, Fedora versions and flavors. I just skip building most of it using a modified [.github/workflows](.github/workflows) folder.
1. My changes are
   * dconf modification: added `service-db:keyfile/user` to [system_files/silverblue/usr/etc/dconf/profile/user](system_files/silverblue/usr/etc/dconf/profile/user) -> I get a hot-synched, human-readable dconf ini file `~/.config/dconf/user.txt` reflecting my custom settings, ready for versioned backup/restore.
   * additional [flathub.org](https://flathub.org/) apps in [system_files/shared/usr/etc/yafti.yml](system_files/shared/usr/etc/yafti.yml)
   * additional `ujust` recipes in the [just](just) folder, all files there will be concatenated when building the image.
   * keeping the original project background image: [system_files/silverblue/usr/share/backgrounds/lagoon.jpg](system_files/silverblue/usr/share/backgrounds/lagoon.jpg) and [system_files/silverblue/usr/share/gnome-background-properties/ublue-lagoon.xml](system_files/silverblue/usr/share/gnome-background-properties/ublue-lagoon.xml)

## Initial install

1. Download the `bluefin-dx-gts.iso` from https://projectbluefin.io/#scene-picker  - select
   * Hardware: Desktop
   * Developer: Yes
   * GPU: Intel or AMD

1. Boot off the ISO and install Bluefin. After reboot and login, open a terminal (Ctrl-Alt-t) and run an initial update cycle:

         ujust update

1. Reboot and login again. If you want to use my custom Bluefin version, open a terminal and do this:

   * [Pin the working deployment](https://docs.fedoraproject.org/en-US/fedora-silverblue/faq/#_how_can_i_upgrade_my_system_to_the_next_major_version_for_instance_rawhide_or_an_upcoming_fedora_release_branch_while_keeping_my_current_deployment) so you can safely rollback:

         sudo ostree admin pin 0

   * Rebase the OS, according to which build you prefer:
     * regular user experience

           sudo rpm-ostree rebase ostree-image-signed:docker://ghcr.io/hirnidrin/bluefin:39

     * developer experience

           sudo rpm-ostree rebase ostree-image-signed:docker://ghcr.io/hirnidrin/bluefin-dx:39

1. Reboot and login, open a terminal (Ctrl-Alt-t) and run another update cycle:

       ujust update
       systemctl reboot

## Maintenance

The system checks daily for updates. If available:
   * Flatpak and distrobox updates are applied immediately.
   * OS updates are staged in the background, then applied on the next reboot.

So just shutdown your machine when you quit working. Come back and power on -> everything is up to date.

## Original documentation

1. [Bluefin Docs](https://universal-blue.discourse.group/docs?category=6)
2. [Discussions and Announcements](https://universal-blue.discourse.group/c/bluefin/6) - strongly recommended!
3. [Developer Experience Edition](https://universal-blue.discourse.group/t/bluefin-dx-the-bluefin-developer-experience/39)
4. [Administrator's Guide](https://universal-blue.discourse.group/t/bluefin-administrators-guide/40)
