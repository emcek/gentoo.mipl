# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Support for common ''feel'' widgets in look-and-feel libraries"
HOMEPAGE="http://java.net/projects/laf-widget"
SRC_URI="http://www.hartwork.org/public/${P}.tar.bz2"
# i.e. a snapshot of https://svn.java.net/svn/laf-widget~svn/tags/release_3_0_daffodil/

LICENSE="BSD"
SLOT="3.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEPEND="dev-java/ant-core:0
	dev-java/asm:2.2"

DEPEND=">=virtual/jdk-1.5 ${COMMON_DEPEND}"
RDEPEND=">=virtual/jre-1.5 ${COMMON_DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-jar-names.patch

	rm -v lib/*.jar || die
	java-pkg_jar-from ant-core ant.jar lib/ant.jar || die
	java-pkg_jar-from asm-2.2 asm.jar lib/asm.jar || die
	java-pkg_jar-from asm-2.2 asm-commons.jar lib/asm-commons.jar|| die

	# Fix java home
	sed \
		-e 's|\(<property name="jdk\.home\.java_version_1\.5\.0" value="\)[^"]\+\(" />\)|\1'"${JAVA_HOME}\2|" \
		-i build.xml || die

	# Remove hard-coded memory limits
	sed \
		-e 's|memoryMaximumSize="[^"]*" *||g' \
		-i build.xml || die

	java-pkg-2_src_prepare

	mkdir -p build/classes || die
}

src_compile() {
	eant || die
}

src_install() {
	java-pkg_dojar drop/laf-widget*.jar || die
}
