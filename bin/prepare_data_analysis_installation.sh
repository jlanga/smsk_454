#!/usr/bin/env bash

# More info on this http://seqanswers.com/forums/showthread.php?t=32727

# Instead of ia32-libs, install only the required libs: libxxx:i386
sudo apt install \
    rpm \
    zlib1g:i386 \
    libxi6:i386 \
    libxtst6:i386 \
    libxaw7:i386

wget \
    --continue \
    http://download.stlinux.com/pub/stlinux/2.4/misc/stlinux24-host-STLinux_deps-20150225-1.i386.rpm

rpm \
    --install \
    --verbose \
    --hash \
    --force-debian \
    stlinux24-host-STLinux_deps-20150225-1.i386.rpm

sudo ln -s /bin/true /bin/rocks
sudo ln -s /usr/bin/lspci /sbin/lspci

echo "Select no!!!"
sleep 10

sudo dpkg-reconfigure dash # Select no
