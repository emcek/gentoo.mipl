# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Lila cursor theme"
HOMEPAGE="http://lila-theme.berlios.de"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86"

RESTRICT="nomirror nostrip"
SRC_URI="${HOMEPAGE}/files/tarballs/${P}.tar.bz2"

RDEPEND="virtual/x11"

src_install() {
	# Setting up X11 implementation...
	X11_IMPLEM_P="$(best_version virtual/x11)"
	X11_IMPLEM="${X11_IMPLEM_P%-[0-9]*}"
	X11_IMPLEM="${X11_IMPLEM##*\/}"
	einfo "X11 implementation is ${X11_IMPLEM}."
	# Creating directories and installing files...
	dodir /usr/share/cursors/${X11_IMPLEM}
	cp -R ${WORKDIR}/${PN}/* ${D}/usr/share/cursors/${X11_IMPLEM}
}
