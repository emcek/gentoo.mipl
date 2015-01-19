# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils toolchain-funcs

DESCRIPTION="3-Dimensional File System Browser"
HOMEPAGE="https://github.com/tomvanbraeckel/3dfsb"
SRC_URI="https://github.com/tomvanbraeckel/${PN}/archive/v${PV}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/gstreamer:1.0
	media-libs/gst-plugins-bad:1.0
	media-libs/gst-plugins-base:1.0
	media-libs/sdl-image
	media-libs/freeglut
	sys-apps/file"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}"/${P}-fix_include.patch
}

doecho() {
	echo "$@"
	"$@" || die
}

src_compile() {
	PACKAGES="glu gstreamer-1.0 SDL_image"
	doecho $(tc-getCC) ${CFLAGS} $(pkg-config --cflags ${PACKAGES}) \
		${LDFLAGS} ${PN}.c $(pkg-config --libs ${PACKAGES}) \
		-lglut -lmagic -lm -o ${PN}
}

src_install() {
	dobin 3dfsb
	dodoc CHANGELOG README.md
}
