# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Lila splash for GNOME"
HOMEPAGE="http://lila-theme.berlios.de"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86"

RESTRICT="nomirror nostrip"
SRC_URI="${HOMEPAGE}/files/tarballs/${P}.tar.bz2"

BASEDIR="/usr/share/pixmaps/splash"
src_install() {
        dodir ${BASEDIR}
        cp -R ${WORKDIR}/${PN}/* ${D}/${BASEDIR}
}

pkg_postinst() {
	echo
	einfo "Lila splash has been copied to"
	einfo "	/usr/share/pixmaps/splash"
	echo
	sleep 5
}
