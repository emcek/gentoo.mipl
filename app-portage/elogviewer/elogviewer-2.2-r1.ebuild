# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
#PYTHON_DEPEND=3

PYTHON_COMPAT=( python2_7 )

inherit eutils python-r1

DESCRIPTION="GTK+ based utility to parse the contents of elogs created by Portage"
HOMEPAGE="http://sourceforge.net/projects/elogviewer/"

SRC_URI="mirror://sourceforge/elogviewer/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~sparc ~ppc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="|| ( dev-python/PyQt4[${PYTHON_USEDEP},X]
			dev-python/pyside[${PYTHON_USEDEP},X] )
		>=sys-apps/portage-2.1"
DEPEND="${RDEPEND}
		dev-python/setuptools[${PYTHON_USEDEP}]"

src_install() {
	mv elogviewer.py elogviewer
	dobin elogviewer || die "dobin failed"
	doman elogviewer.1
	make_desktop_entry elogviewer Elogviewer "" "System" ||
		die "Couldn't make desktop entry"
	python_convert_shebangs -r 3 "${ED}"
}

pkg_postinst() {
	elog
	elog "In order to use this software, you need to activate"
	elog "Portage's elog features.  Required is"
	elog "		 PORTAGE_ELOG_SYSTEM=\"save\" "
	elog "and at least one out of "
	elog "		 PORTAGE_ELOG_CLASSES=\"warn error info log qa\""
	elog "More information on the elog system can be found"
	elog "in /etc/make.conf.example"
	elog
	elog "To operate properly this software needs the directory"
	elog "${PORT_LOGDIR:-/var/log/portage}/elog created, belonging to group portage."
	elog "To start the software as a user, add yourself to the portage"
	elog "group."
	elog
}
