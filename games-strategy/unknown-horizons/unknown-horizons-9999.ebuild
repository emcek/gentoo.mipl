# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="sqlite"

inherit git-2 distutils-r1 python-r1

DESCRIPTION="Anno-like real time strategy game"
HOMEPAGE="http://unknown-horizons.org/"

EGIT_REPO_URI="git://github.com/unknown-horizons/unknown-horizons.git"

SRC_URI=""

LICENSE="GPL-2"
KEYWORDS=""
SLOT="0"
IUSE=""

DEPEND="
	dev-python/bsddb3
	=games-engines/fife-9999
	dev-python/pyyaml
	dev-python/python-distutils-extra
"

RDEPEND="$DEPEND"
