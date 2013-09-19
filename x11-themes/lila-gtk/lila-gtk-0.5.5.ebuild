# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Lila themes for GTK+"
HOMEPAGE="http://lila-theme.berlios.de"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~sparc ~x86"

RESTRICT="nomirror nostrip"
SRC_URI="${HOMEPAGE}/files/tarballs/${P}.tar.bz2"

DEPEND="x11-themes/gnome-themes-extras"

BASEDIR="/usr/share/themes"
src_install() {
        dodir ${BASEDIR}
        cp -R ${WORKDIR}/${PN}/* ${D}/${BASEDIR}
}
