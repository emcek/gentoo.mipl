# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Swing look-and-feel library"
HOMEPAGE="https://github.com/kirillcool/substance"
SRC_URI="http://www.hartwork.org/public/${P}.tar.bz2"
# i.e. a snapshot of https://svn.java.net/svn/substance~svn/tags/release_5_3_reykjavik/

LICENSE="BSD CC-BY-SA-2.5"  # TODO have a closer look
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jdk-1.7"
RDEPEND=">=virtual/jre-1.7"

src_prepare() {
	# Fix java home
	sed \
		-e "s|^jdk.home=.*|jdk.home=${JAVA_HOME}|" \
		-i build.properties || die

	# Remove hard-coded memory limits
	sed \
		-e 's|memoryMaximumSize="[^"]*" *||g' \
		-i build.xml || die

	ewarn "These .jar files might still need to be unbundled:"
	ewarn "$(find . -name '*.jar' -print)"

	java-pkg-2_src_prepare
}

src_compile() {
	eant || die
}

src_install() {
	java-pkg_dojar ./drop/substance*.jar || die
}
