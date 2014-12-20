# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit cmake-utils games subversion

DESCRIPTION="FreeOrion is a free and open source clone of Master Of Orion"
HOMEPAGE="http://www.freeorion.org"
ESVN_REPO_URI="https://${PN}.svn.sourceforge.net/svnroot/${PN}/trunk/FreeOrion"
ESVN_PROJECT="${PN}"

#LICENSE="GPL-2 CCPL-Attribution-ShareAlike-3.0"
LICENSE="GPL-2 LGPL-2.1 CC-BY-SA-3.0"
KEYWORDS="~amd64 ~x86"
IUSE="cg debug threads"

SLOT="0"

RDEPEND="
	!dev-games/gigi
	dev-games/gigi-fo[threads=,ogre,ois]
	>=dev-games/ogre-1.8.0[threads=]
	<dev-lang/python-3
	>=dev-libs/boost-1.50[threads=]
	media-gfx/graphviz
	>=media-libs/freealut-1.1.0
	>=media-libs/libogg-1.3.0
	>=media-libs/libvorbis-1.3.2
	>=media-libs/openal-1.14
	>=sci-physics/bullet-2.77
	media-libs/libpng:1.2
	media-libs/freetype:2
	>=sys-libs/zlib-1.2.5"

DEPEND="${RDEPEND}
	sys-devel/libtool
	virtual/pkgconfig"

CMAKE_USE_DIR="${S}"

src_unpack() {
	subversion_src_unpack
}

src_prepare() {
	# Let's make the autorevision work.
	subversion_wc_info
	sed -i -e \
		"s:svn_revision_number ???:svn_revision_number ${ESVN_WC_REVISION}:" \
		CMakeLists.txt || die "sed FreeOrion/CMakeLists.txt failed"

	# remove cmake calls to GG
	epatch "${FILESDIR}/unbundle_gigi.patch"
}

src_configure() {
	# Due to the testing nature of gigi and freeorion,
	# and all the ogre+boost stuff, flags should be filtered:
	strip-flags

	# Type-Pun pointers always break strict aliasing rules,
	# and this thing is full of those
	append-flags -fno-strict-aliasing

	local mycmakeargs=(
		$(cmake-utils_use_enable debug DEBUG)
		$(cmake-utils_use_build debug DEBUG)
		"-DCMAKE_INSTALL_PREFIX=${GAMES_PREFIX}/${PN}"
		"-DCMAKE_INSTALL_ICONDIR=${GAMES_DATADIR_BASE}/pixmaps/"
		"-DCMAKE_INSTALL_DESKTOPDIR=${GAMES_DATADIR_BASE}/applications/"
		"-DCMAKE_DOC_DIR=/usr/share/doc/${PF}"
		"-DCMAKE_MAN_DIR=/usr/share/man"
		"-DCMAKE_DATA_DIR=${GAMES_DATADIR}"
		"-DCMAKE_DATA_PATH=${GAMES_DATADIR}"
	)

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install

	## This is a rather wild thing, but I can't think of a quicker way right now:
	# Add ogre_plugins config:

	OGRECFG="${D}/${GAMES_PREFIX}/${PN}/ogre_plugins.cfg"
	cat > ${OGRECFG} <<EOF
# Plugin folder
PluginFolder=/usr/lib64/OGRE
# Plugins
Plugin=RenderSystem_GL
Plugin=Plugin_ParticleFX
Plugin=Plugin_OctreeSceneManager
EOF

	## Extra-Plugin with cg enabled:
	use cg && echo "Plugin=Plugin_CgProgramManager" >> ${OGRECFG}

	prepgamesdirs
}
