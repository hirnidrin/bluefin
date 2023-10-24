# bluefin

A clone of [ublue-os bluefin](https://github.com/ublue-os/bluefin), slightly adapted for me. All credit goes to [team Universal Blue](https://universal-blue.org/) - my hat's off to you!

## Notes

1. I only build the the `bluefin` and `bluefin-dx` editions, for Intel or AMD GPU based hardware.
1. I don't build the toolboxes, except the `wolfi-toolbox` (experimental). Let's just work with the originals.
1. This repo holds the full code for all editions and toolboxes. I just skip building most of it using a modified `.github/workflows` folder.
1. My changes are
   * modified/additional dconf settings in `usr/etc/dconf/db/local.d/02-mysysdefaults`.
   * additional [flathub.org](https://flathub.org/) apps in `usr/etc/yafti.yml`.
   * additional `just` recipes in the `just/` folder, all files there will be concatenated when building the image.
   * additional distrobox images in `dx/etc/distrobox/distrobox.ini` (build with `just assemble`):
     * todo

## Initial install

1. Download and install the latest `universalblue-38.iso` from [ublue-os/main/releases](https://github.com/ublue-os/main/releases). Follow the official [installation instructions](https://universal-blue.org/installation/). Quick steps when booting off the ISO:
   * Choose `Install ublue-os/main` (this is for Intel/AMD GPU hardware).
   * Then choose `Install silverblue-main (GNOME)`.
   * Now walk thru the installation wizard.

2. After reboot and login, open a terminal and do this:
   * [Pin the working deployment](https://docs.fedoraproject.org/en-US/fedora-silverblue/faq/#_how_can_i_upgrade_my_system_to_the_next_major_version_for_instance_rawhide_or_an_upcoming_fedora_release_branch_while_keeping_my_current_deployment) so you can safely rollback:

         sudo ostree admin pin 0

   * Rebase the OS, according to which build you prefer:
     * regular user experience

           sudo rpm-ostree rebase ostree-image-signed:docker://ghcr.io/hirnidrin/bluefin:38

     * developer experience

           sudo rpm-ostree rebase ostree-image-signed:docker://ghcr.io/hirnidrin/bluefin-dx:38

3. Reboot and login, open a terminal (Ctrl-Alt-t) and run an update cycle:

       just update
       systemctl reboot

## Maintenance

The system checks daily for updates. If available:
   * Flatpak and distrobox updates are applied immediately.
   * OS updates are staged in the background, then applied on the next reboot.

So just shutdown your machine when you quit working. Come back and power on -> everything is up to date.

## Original documentation

1. [Bluefin](https://universal-blue.org/images/bluefin/)
2. [Discussions and Announcements](https://github.com/orgs/ublue-os/discussions/categories/bluefin) - strongly recommended!
3. [Developer Experience Edition](https://universal-blue.org/images/bluefin/developer-experience/)
4. [Administrator's Guide](https://universal-blue.org/images/bluefin/admin/)
