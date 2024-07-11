FROM quay.io/toolbx-images/opensuse-toolbox:tumbleweed

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience" \
      maintainer="jorge.castro@gmail.com"

RUN   zypper -n dup
RUN   zypper ar -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/' packman
RUN   zypper --no-gpg-checks ref
COPY extra-packages /

RUN   cat /extra-packages | xargs zypper -n install

RUN   ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak
RUN   ln -fs /usr/bin/distrobox-host-exec /usr/bin/ujust
