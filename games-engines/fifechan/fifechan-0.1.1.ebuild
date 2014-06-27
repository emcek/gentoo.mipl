# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools git-2

DESCRIPTION="Lightweight cross platform GUI library written in C++ specifically designed for games"
HOMEPAGE="http://fifengine.github.io/fifechan/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/fifengine/fifechan.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="allegro opengl"

DEPEND="x11-libs/libXext
		media-libs/libsdl
		media-libs/sdl-ttf
		media-libs/sdl-image[png]
		opengl? ( virtual/opengl
				virtual/glu )
		allegro? ( media-libs/allegro )"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_enable allegro)
}

src_compile() {
	emake || die "compile failed"
}

src_install() {
	emake DESTDIR="${D}" install
}
