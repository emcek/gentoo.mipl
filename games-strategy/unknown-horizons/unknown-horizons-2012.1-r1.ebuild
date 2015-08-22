# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )
PYTHON_USE_WITH="sqlite"

inherit python-r1 games distutils-r1

DESCRIPTION="Anno-like real time strategy game"
HOMEPAGE="http://www.unknown-horizons.org/"

SRC_URI="mirror://sourceforge/unknownhorizons/${P}.tar.xz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

DEPEND="dev-python/pyyaml
	dev-python/bsddb3
	=games-engines/fife-0.3.3-r4"

RDEPEND="$DEPEND"

S="${WORKDIR}"/${PN}

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
	games_pkg_setup
}

src_compile() {
	distutils_src_compile build_i18n
}

src_prepare() {
	# make sure version two is started for startup scripts
	python_convert_shebangs -r 2 .
}

src_install() {
	distutils_src_install
	# fix install paths to Gentoo specific locations
	insinto "${GAMES_DATADIR}/${PN}"
	doins -r content || die "doins failed"
	rm -rf "${D}/usr/share/${PN}/content"
	dogamesbin "${D}/usr/bin/${PN}" || die "dogamesbin failed"
	rm -rf "${D}/usr/bin/"
	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst
	distutils_pkg_postinst
}
