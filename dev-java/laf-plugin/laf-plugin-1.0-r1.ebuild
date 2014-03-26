# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Plugin framework for look-and-feels"
HOMEPAGE="http://java.net/projects/laf-plugin"
SRC_URI="http://www.hartwork.org/public/${P}.tar.bz2"
# i.e. a snapshot of https://svn.java.net/svn/laf-plugin~svn/tags/release_1_0_vile_weed/

LICENSE="BSD"
SLOT="1.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jdk-1.7"
RDEPEND=">=virtual/jre-1.7"

src_prepare() {
	mv build{5.0,}.xml || die

	# Fix java home
	sed \
		-e 's|\(<property name="jdk\.home\.java_version_7\.0" value="\)[^"]\+\(" />\)|\1'"${JAVA_HOME}\2|" \
		-i build.xml || die

	# Remove hard-coded memory limits
	sed \
		-e 's|memoryMaximumSize="[^"]*" *||g' \
		-i build.xml || die

	java-pkg-2_src_prepare

	mkdir -p build/classes50 || die
}

src_compile() {
	eant || die
}

src_install() {
	java-pkg_newjar drop/laf-plugin-50.jar laf-plugin.jar || die
	dodoc www/index.html || die
}
