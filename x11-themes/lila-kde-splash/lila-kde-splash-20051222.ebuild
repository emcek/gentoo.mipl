# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Lila splash for KDE"
HOMEPAGE="http://lila-theme.berlios.de"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86"

RESTRICT="nomirror nostrip"
SRC_URI="http://download.berlios.de/lila-theme/${P}.tar.gz"

DEPEND="|| ( >=kde-base/kdm-3.4 >=kde-base/kdebase-3.4 )"

BASEDIR="$(kde-config --prefix)/share/apps/ksplash/Themes"
src_install() {
        dodir ${BASEDIR}
        cp -R ${WORKDIR}/* ${D}/${BASEDIR}
}

