# bluefin

A clone of [ublue-os bluefin](https://github.com/ublue-os/bluefin), slightly adapted for me. All credit goes to [team Universal Blue](https://universal-blue.org/) - my hat's off to you!

## Notes

1. I don't build
   * the NVIDIA GPU version.
   * the Framework laptop version.
   * the toolboxes. Let's just work with the originals.
1. This repo holds the code for all of the above. I just skip building these using a modified `.github/workflows` folder.
1. My changes are
   * modified/additional dconf settings in `etc/dconf/db/local.d/02-mysysdefaults`
   * modified/additional packages in `etc/yafti.yml`
   * additional distrobox image in `dx/etc/distrobox/distrobox.ini` (build with `just assemble`):
     * [chainguard.dev](https://edu.chainguard.dev/chainguard/chainguard-images/reference/node/image_specs/) nodejs development image.

## Usage

1. Download and install the latest `universalblue-38.iso` from [ublue-os/main/releases](https://github.com/ublue-os/main/releases). Follow the official [installation instructions](https://ublue.it/installation/). Steps:
   * When booting off the ISO, first choose your system's GPU hardware: either AMD/Intel, or NVIDIA.
   * In the next step choose the image with the GNOME desktop environment: `silverblue`
   * Now walk thru the installation wizard.

2. After you reboot you should [pin the working deployment](https://docs.fedoraproject.org/en-US/fedora-silverblue/faq/#_about_using_silverblue) so you can safely rollback:

       sudo ostree admin pin 0

3. Open a terminal and rebase the OS, according to which build you prefer:
   * regular user experience

         sudo rpm-ostree rebase ostree-image-signed:docker://ghcr.io/hirnidrin/bluefin:38

   * developer experience

         sudo rpm-ostree rebase ostree-image-signed:docker://ghcr.io/hirnidrin/bluefin-dx:38

4. Reboot the system and you're done!

## Original documentation

1. [Bluefin](https://universal-blue.org/images/bluefin/)
2. [Developer Experience Edition](https://universal-blue.org/images/bluefin/developer-experience/)
3. [Administrator's Guide](https://universal-blue.org/images/bluefin/admin/)
4. [Framework Images](https://universal-blue.org/images/bluefin/framework/)
