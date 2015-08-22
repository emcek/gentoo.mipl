# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION="3-Dimensional File System Browser"
HOMEPAGE="https://github.com/tomvanbraeckel/3dfsb"
SRC_URI="https://github.com/tomvanbraeckel/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

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
	media-gfx/imagemagick
	virtual/pkgconfig"

PATCHES=( "${FILESDIR}"/${P}-complete_cmake.patch )

src_compile() {
	mogrify -format xpm images/*.png || die
	cmake-utils_src_compile
}

src_install() {
	dobin "${BUILD_DIR}"/3dfsb
	dodoc CHANGELOG README.md
}
