# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Lila splashimage for GRUB"
HOMEPAGE="http://lila-theme.berlios.de"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="nomirror nostrip"
SRC_URI="${HOMEPAGE}/files/tarballs/${P}.tar.bz2"

DEPEND="sys-boot/grub"

BASEDIR="/usr/share/grub/splashimages"
src_install() {
        dodir ${BASEDIR}
        cp -R ${WORKDIR}/${PN}/* ${D}/${BASEDIR}
}

pkg_postinst() {
	echo
	einfo "Lila splashimage has been copied to"
	einfo " /usr/share/grub/splashimages"
	echo
	sleep 5
}
