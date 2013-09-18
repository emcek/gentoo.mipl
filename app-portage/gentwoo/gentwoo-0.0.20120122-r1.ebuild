# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_NEEDED="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit python

DESCRIPTION="Client program for Social Compiling site GenTwoo"
HOMEPAGE="http://gentwoo.elisp.net"
SRC_URI="http://gentwoo.elisp.net/download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/simplejson"

src_install() {
	gentwoo_install() {
		python_convert_shebangs -- ${PYTHON_ABI} gentwoo.py
		newbin gentwoo.py gentwoo-${PYTHON_ABI}
	}
	python_execute_function gentwoo_install
	python_generate_wrapper_scripts "${ED}"usr/bin/gentwoo

	insinto /etc
	doins gentwoo.conf
}
