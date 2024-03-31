# bluefin

A clone of [ublue-os bluefin](https://github.com/ublue-os/bluefin), slightly adapted for me. All credit goes to the [Project Bluefin team](https://projectbluefin.io/) and contributors - my hat's off to you!

## Notes

1. I only build the the `bluefin` and `bluefin-dx` editions, for Intel or AMD GPU based hardware.
1. This repo holds the full code for all editions. I just skip building most of it using a modified `.github/workflows` folder.
1. My changes are
   * modified/additional dconf settings in `usr/etc/dconf/db/local.d/50-my-defaults` and `dx/usr/etc/dconf/db/local.d/60-my-dx-keybindings`.
   * additional [flathub.org](https://flathub.org/) apps in `usr/etc/yafti.yml`.
   * additional `just` recipes in the `just/` folder, all files there will be concatenated when building the image.
   * additional distrobox images in `dx/etc/distrobox/distrobox.ini` (build with `ujust assemble`):
     * todo

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

1. Reboot and login, open a terminal (Ctrl-Alt-t) and run an update cycle:

       just update
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
