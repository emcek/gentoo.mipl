# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit qt4-r2

DESCRIPTION="Frontend for scummvm and dosbox"
HOMEPAGE="http://www.gr-lida.org"
SRC_URI="https://github.com/Monthy/${PN}/tarball/v${PV} -> ${PN}-${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dosbox scummvm"

DEPEND="x11-libs/qt-gui:4
	x11-libs/qt-sql:4[sqlite]
	dosbox? ( games-emulation/dosbox )
	scummvm? ( games-engines/scummvm )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/Monthy-${PN}-d686834"

src_configure(){
	eqmake4 "${PN}".pro
}

src_install(){
	emake INSTALL_ROOT="${D}" install || die "Install Failed"
}

pkg_postinst(){
	elog "The GUI is by default in Spanish."
	elog "If you need it, English is available on the Options Menu."
}
