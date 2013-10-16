# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

JAVA_PKG_WANT_BUILD_VM="sun-jdk-1.6"
JAVA_PKG_WANT_SOURCE="1.6"
JAVA_PKG_WANT_TARGET="1.6"

inherit eutils flag-o-matic git-2 java-pkg-2 java-ant-2 toolchain-funcs

DESCRIPTION="Photo editing for professional photographers who like things made simple"
HOMEPAGE="http://www.lightcrafts.com/lightzone/"
EGIT_REPO_URI="git://github.com/xmw/${PN}.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-java/sun-jai-bin
	dev-java/sun-jdk:1.6
	sys-libs/zlib"
DEPEND="${RDEPEND}
	app-text/recode
	app-text/htmltidy
	dev-java/javahelp"

EGIT_SOURCEDIR=${WORKDIR}/${P}
S=${WORKDIR}/${P}/linux

#src_unpack() {
#	cp -r /tmp/${PN} ${P}
#}

src_prepare() {
	#unbundle dev-java/javahelp
	rm -v lib/jh.jar || die
	ln -s "${EPREFIX}"/usr/share/javahelp/lib/jh.jar \
		lib/jh.jar || die

	#unbundle dev-java/sun-jai-bin
	rm -v lib/{libmlib_jai.so,mlibwrapper_jai.jar} || die

	cd ../lightcrafts
	rm -r coprocesses/dcraw || die
	sed -e '/_mm_srai_epi64/s:^://:' \
		-i jnisrc/macstl/impl/vec_mmx.h || die

	echo """
CC=$(tc-getCC)
CXX=$(tc-getCXX)
AR=$(tc-getAR)
PLATFORM_CFLAGS=${CFLAGS} -fPIC
PLATFORM_LDFLAGS=${LDFLAGS} -fPIC
AUTO_DEP_CC=$(tc-getCC)
PROCESSOR=gentoo
#JNI_LINUX_CFLAGS=-fPIC
#JNI_LINUX_LDFLAGS=-fPIC
SEGM_LDFLAGS=${LDFLAGS}
LCMS_LDFLAGS=${LDFLAGS}
""" >> mk/platform.mk || die
}

src_compile() {
	tc-export CC
	java-pkg-2_src_compile
}

src_install() {
	doicon icons/${PN}_{16,32}.png

	java-pkg_dojar products/lightcrafts-linux.jar
	java-pkg_dojar products/lightzonehelp.jar

	cd ../lightcrafts/products
	java-pkg_dojar lightcrafts.jar lcjai.jar
	java-pkg_doso *.so ${PN}-forkd

#	insinto ${JAVA_PKG_LIBDEST}
#	insopts -m755
#	doins dcraw || die
#
#	java-pkg_register-environment-variable LD_LIBRARY_PATH ${JAVA_PKG_LIBDEST}

	java-pkg_dolauncher ${PN} \
		--main com.lightcrafts.app.Application \
		--pwd ${JAVA_PKG_LIBDEST}

	make_desktop_entry ${PN} ${PN} ${PN}_32 \
		"Graphics;2DGraphics;RasterGraphics" || die
}
