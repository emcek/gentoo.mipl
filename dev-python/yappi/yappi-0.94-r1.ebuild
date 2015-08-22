# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

#SUPPORT_PYTHON_ABIS="1"
#DISTUTILS_SRC_TEST="nosetests"

inherit distutils-r1

DESCRIPTION="Yet Another Python Profiler, but this time support Multithread/CPU time profiling"
HOMEPAGE="http://yappi.googlecode.com/"
SRC_URI="mirror://pypi/y/yappi/yappi-${PV}.tar.gz"
#SRC_URI="https://pypi.python.org/packages/source/y/yappi/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

IUSE="test"

# Tests dont make sense without a git repo
RESTRICT="test"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
	)"
