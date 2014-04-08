# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit qt4-r2

MY_P="GR-lida-${PV}"

DESCRIPTION="Frontend for scummvm and dosbox"
HOMEPAGE="http://www.gr-lida.org"
SRC_URI="https://github.com/Monthy/${PN}/tarball/v${PV} -> ${PN}-${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dosbox scummvm"

DEPEND="dev-qt/qtgui:4
		dev-qt/qtsql:4[sqlite]
		dosbox? ( games-emulation/dosbox )
		scummvm? ( games-engines/scummvm )"
RDEPEND="${DEPEND}"

#S=${WORKDIR}/${MY_P}
S="${WORKDIR}/Monthy-${PN}-0bdade8"

pkg_postinst(){
	elog "The GUI is by default in Spanish."
	elog "If you need it, English is available on the Options Menu."
}
