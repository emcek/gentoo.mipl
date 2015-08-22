# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_USE_WITH="sqlite berkdb"
PYTHON_COMPAT=( python2_7 )
inherit distutils-r1 games python-r1

DESCRIPTION="Anno-like real time strategy game"
HOMEPAGE="http://www.unknown-horizons.org/"

SRC_URI="mirror://sourceforge/unknownhorizons/${P}-source.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

DEPEND="dev-python/pyyaml
	=games-engines/fife-0.3.3-r4"

RDEPEND="$DEPEND"

S="${WORKDIR}"/${PN}

src_compile() {
	distutils_src_compile build_i18n
}

src_install() {
	# FIXME: exe and data-files goes into wrong place, games.gentoo.org policy
	# violation
	distutils_src_install
	prepgamesdirs
}
