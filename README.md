# bluefin

A clone of [ublue-os bluefin](https://github.com/ublue-os/bluefin), slightly adapted for me. All credit goes to [team Universal Blue](https://universal-blue.org/) - my hat's off to you!

## Notes

1. I don't build
   * the NVIDIA GPU version.
   * the Framework laptop version.
   * the toolboxes. Let's just work with the originals.
1. This repo holds the code for all of the above. I just skip building these using a modified `.github/workflows` folder.
1. My changes are
   * modified/additional dconf settings in `usr/etc/dconf/db/local.d/02-mysysdefaults`
   * modified/additional packages in `usr/etc/yafti.yml`
   * additional distrobox image in `dx/etc/distrobox/distrobox.ini` (build with `just assemble`):
     * [chainguard.dev](https://edu.chainguard.dev/chainguard/chainguard-images/reference/node/image_specs/) nodejs development image.

## Initial install

1. Download and install the latest `universalblue-38.iso` from [ublue-os/main/releases](https://github.com/ublue-os/main/releases). Follow the official [installation instructions](https://ublue.it/installation/). Quick steps when booting off the ISO:
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
   * OS updates are applied on the next reboot.

So just shutdown your machine when you quit working. Come back and power on -> everything is up to date.

## Original documentation

1. [Bluefin](https://universal-blue.org/images/bluefin/)
2. [Discussions and Announcements](https://github.com/orgs/ublue-os/discussions/categories/bluefin) - strongly recommended!
3. [Developer Experience Edition](https://universal-blue.org/images/bluefin/developer-experience/)
4. [Administrator's Guide](https://universal-blue.org/images/bluefin/admin/)
5. [Framework Images](https://universal-blue.org/images/bluefin/framework/)
