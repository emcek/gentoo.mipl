# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

WX_GTK_VER="2.8"

inherit eutils subversion wxwidgets games

MY_PV="r${PV%_*}-alpha"
MY_P=${PN}-${MY_PV}

DESCRIPTION="A free, real-time strategy game of ancient warfare"
HOMEPAGE="http://play0ad.com/"
ESVN_REPO_URI="http://svn.wildfiregames.com/public/ps/trunk"

LICENSE="GPL-2 LGPL-2.1 MIT CC-BY-SA-3.0"
SLOT="0"
KEYWORDS=""
IUSE="+sound editor fam pch test"

RDEPEND="
	dev-lang/spidermonkey:24
	dev-libs/boost
	dev-libs/libxml2
	!games-strategy/0ad-data
	media-gfx/nvidia-texture-tools
	media-libs/libpng:0
	media-libs/libsdl[X,opengl,video]
	net-libs/enet:1.3
	net-libs/miniupnpc
	net-libs/gloox
	net-misc/curl
	sys-libs/zlib
	virtual/jpeg:=
	virtual/opengl
	x11-libs/libX11
	x11-libs/libXcursor
	sound? ( media-libs/libogg
		media-libs/libvorbis
		media-libs/openal )
	editor? ( x11-libs/wxGTK:${WX_GTK_VER}[X,opengl] )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	test? ( dev-lang/perl )"

S=${WORKDIR}/trunk

CHECKREQS_MEMORY="512M"
CHECKREQS_DISK_BUILD="6G"

src_unpack() {
	subversion_src_unpack
}

src_configure() {
	cd build/workspaces || die

	./update-workspaces.sh \
		--with-system-nvtt \
		--with-system-enet \
		--with-system-mozjs24 \
		--with-system-miniupnpc \
	$(usex pch "" "--without-pch") \
		$(usex test "" "--without-tests") \
		$(usex sound "" "--without-audio") \
		$(use_enable editor atlas) \
		--bindir="${GAMES_BINDIR}" \
		--libdir="$(games_get_libdir)"/${PN} \
		--datadir="${GAMES_DATADIR}"/${PN}
}

src_compile() {
	# build 3rd party fcollada
#	emake -C libraries/source/fcollada/src

	# build 0ad
	emake -C build/workspaces/gcc verbose=1
}

src_test() {
	cd binaries/system || die
	./test -libdir "${S}/binaries/system" || die "test phase failed"
}

src_install() {
	# data
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r binaries/data/*

	# bin
	dogamesbin binaries/system/pyrogenesis

	# libs
	exeinto "$(games_get_libdir)"/${PN}
	doexe binaries/system/libCollada.so
	use editor && doexe binaries/system/libAtlasUI.so

	# other
	dodoc binaries/system/readme.txt
	doicon build/resources/${PN}.png
	games_make_wrapper ${PN} "${GAMES_BINDIR}/pyrogenesis"
	make_desktop_entry ${PN} "0 A.D."

	# permissions
	prepgamesdirs
}
