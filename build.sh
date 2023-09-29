#!/bin/sh

set -ouex pipefail

# force use of single rpmfusion mirror
sed -i.bak 's%^metalink=%#metalink=%' /etc/yum.repos.d/fedora-updates.repo
sed -i 's%^#baseurl=http://download.example/pub/fedora/linux/updates/$releasever/Everything/$basearch/%baseurl=http://mirror.init7.net/fedora/fedora/linux/updates/38/Everything/x86_64/%' /etc/yum.repos.d/fedora-updates.repo

RELEASE="$(rpm -E %fedora)"

INCLUDED_PACKAGES=($(jq -r "[(.all.include | (select(.\"$PACKAGE_LIST\" != null).\"$PACKAGE_LIST\")[]), \
                             (select(.\"$FEDORA_MAJOR_VERSION\" != null).\"$FEDORA_MAJOR_VERSION\".include | (select(.\"$PACKAGE_LIST\" != null).\"$PACKAGE_LIST\")[])] \
                             | sort | unique[]" /tmp/packages.json))
EXCLUDED_PACKAGES=($(jq -r "[(.all.exclude | (select(.\"$PACKAGE_LIST\" != null).\"$PACKAGE_LIST\")[]), \
                             (select(.\"$FEDORA_MAJOR_VERSION\" != null).\"$FEDORA_MAJOR_VERSION\".exclude | (select(.\"$PACKAGE_LIST\" != null).\"$PACKAGE_LIST\")[])] \
                             | sort | unique[]" /tmp/packages.json))



if [[ "${#INCLUDED_PACKAGES[@]}" -gt 0 ]]; then
    rpm-ostree install \
        ${INCLUDED_PACKAGES[@]}
else
    echo "No packages to install."
fi

if [[ "${#EXCLUDED_PACKAGES[@]}" -gt 0 ]]; then
    EXCLUDED_PACKAGES=($(rpm -qa --queryformat='%{NAME} ' ${EXCLUDED_PACKAGES[@]}))
fi
if [[ "${#EXCLUDED_PACKAGES[@]}" -gt 0 ]]; then
    rpm-ostree override remove \
        ${EXCLUDED_PACKAGES[@]}
fi

# reset forced use of single rpmfusion mirror
rename -v .repo.bak .repo /etc/yum.repos.d/fedora-updates.repo.bak