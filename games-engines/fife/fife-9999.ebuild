# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit cmake-utils git-r3 python-single-r1

DESCRIPTION="Flexible Isometric Free Engine"
HOMEPAGE="http://fifengine.de/"
SRC_URI=""

EGIT_BRANCH="master"
EGIT_REPO_URI="git://github.com/fifengine/fifengine.git"

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="debug +fifechan opengl profile +zip"

RDEPEND=">=dev-libs/boost-1.33.1
	>=media-libs/libsdl-1.2.8
	>=media-libs/sdl-ttf-2.0
	>=media-libs/sdl-image-1.2.10[png]
	media-libs/libvorbis
	media-libs/freealut
	media-libs/libogg
	media-libs/openal
	>=sys-libs/zlib-1.2
	x11-libs/libXcursor
	opengl? ( virtual/opengl
			virtual/glu )
	media-libs/libpng:0
	x11-libs/libXext
	fifechan? ( >=games-engines/fifechan-0.1.0 )
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	>=dev-libs/tinyxml-2.5.3"

DEPEND="${RDEPEND}
	>=dev-lang/swig-1.3.40:0"

PATCHES=(
	"${FILESDIR}/${P}-unbundle-libpng.patch"
)

src_configure() {
	local mycmakeargs=(
		$(usex debug)
		$(usex fifechan)
	    $(usex profile)
		$(usex opengl)
		$(usex zip)
	)
	cmake-utils_src_configure
}
