# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Lila theme for Audacious"
HOMEPAGE="http://lila-theme.berlios.de"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~sparc ~x86"

RESTRICT="nomirror nostrip"
SRC_URI="${HOMEPAGE}/files/tarballs/${P}.tar.bz2"

DEPEND="media-sound/audacious"

BASEDIR="/usr/share/audacious/Skins/Lila"
src_install() {
        dodir ${BASEDIR}
        cp -R ${WORKDIR}/${PN}/* ${D}/${BASEDIR}
}
