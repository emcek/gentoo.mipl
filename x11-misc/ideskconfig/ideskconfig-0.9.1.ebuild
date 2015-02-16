# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT=( python2_7 )
inherit python-single-r1 multilib

DESCRIPTION="A GUI configuration utility for the iDesk application"
HOMEPAGE="http://ideskconfig.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=${PYTHON_DEPS}

RDEPEND="dev-python/pygtk:2
	x11-misc/idesk"

S=${WORKDIR}/${P}/src

pkg_setup() {
	python-single-r1_pkg_setup
}

src_prepare() {
	default
	python_convert_shebangs -r 2 .
}

src_install() {
	insinto /usr/$(get_libdir)/${PN}
	doins idesk{_config,ConfigParser,IconEditor,IconParser}.py
	dosym /usr/$(get_libdir)/${PN}/idesk_config.py /usr/bin/ideskconfig
	fperms +x /usr/$(get_libdir)/${PN}/idesk_config.py
	dodoc ../{README,TODOLIST}
}

pkg_postinst() {
	python_mod_optimize "/usr/$(get_libdir)/${PN}"
}

pkg_postrm() {
	python_mod_cleanup "/usr/$(get_libdir)/${PN}"
}
