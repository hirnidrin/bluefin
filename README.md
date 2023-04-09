# bluefin

A clone of [ublue-os bluefin](https://github.com/ublue-os/bluefin), slightly adapted for me. All credit goes to [team uBlue](https://ublue.it/) - my hat's off to you!

## Usage

1. Download and install the latest `universalblue-38.iso` from [ublue-os/main/releases](https://github.com/ublue-os/main/releases). Follow the official [installation instructions](https://ublue.it/installation/). Steps:
  * When booting off the ISO, first choose your system's GPU hardware: either AMD/Intel, or NVIDIA.
  * In the next step choose the image with the GNOME desktop environment: `silverblue`
  * Now walk thru the installation wizard.

2. After you reboot you should [pin the working deployment](https://docs.fedoraproject.org/en-US/fedora-silverblue/faq/#_about_using_silverblue) so you can safely rollback:

        sudo ostree admin pin 0

3. Open a terminal and rebase the OS, according the GPU hardware of your system:
  * AMD/Intel

        sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/hirnidrin/bluefin:38

  * NVIDIA

        sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/hirnidrin/bluefin-nvidia:38

4. Reboot the system and you're done!
