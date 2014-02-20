# By Eroen, 2013
# Distributed under the terms of the ISC license
# $Header: $

EAPI=5

inherit eutils flag-o-matic versionator games cmake-utils
[[ $(get_version_component_range $(get_version_component_count)) == *999? ]] && inherit git-r3

DESCRIPTION="Unofficial open source engine reimplementation of the game Morrowind"
HOMEPAGE="https://openmw.org/"
LICENSE="GPL-3 MIT BitstreamVera OFL-1.1"
SLOT="0"
KEYWORDS=""
IUSE="+launcher minimal +opencs profile test +tr1"

if [[ $(get_version_component_range $(get_version_component_count)) == *999? ]]; then
	EGIT_REPO_URI="git://github.com/zinnschlag/openmw.git"
	if [[ $(get_version_component_count) -ge 4 ]]; then
		EGIT_BRANCH=openmw$(get_version_component_range 2)
	fi
else
	SRC_URI="https://github.com/zinnschlag/${PN}/archive/${P}.tar.gz"
	S="${WORKDIR}"/${PN}-${P}
fi

OPENMW_LIBS="dev-games/mygui
	dev-libs/tinyxml
	media-libs/openal
	virtual/ffmpeg
	sci-physics/bullet"
LAUNCHER_LIBS="app-arch/unshield
	dev-qt/qtcore
	dev-qt/qtgui"
OPENCS_LIBS="dev-qt/qtcore
	dev-qt/qtgui
	dev-qt/qtxmlpatterns"

HDEPEND=""
LIBDEPEND="${OPENMW_LIBS}
	launcher? ( ${LAUNCHER_LIBS} )
	opencs? ( ${OPENCS_LIBS} )
	dev-games/ogre[boost,cg,freeimage,opengl,threads,zip]
	dev-libs/boost:=[threads]
	media-libs/libsdl2"
DEPEND="${LIBDEPEND}
	test? ( dev-cpp/gmock[tr1=]
	    dev-cpp/gtest[tr1=] )"
[[ ${EAPI} == *-hdepend ]] || DEPEND+=" ${HDEPEND}"
RDEPEND="${LIBDEPEND}"

pkg_setup() {
	if use test && ! use tr1; then
		append-cflags -DGTEST_USE_OWN_TR1_TUPLE=1
		append-cxxflags -DGTEST_USE_OWN_TR1_TUPLE=1
	fi
}

src_prepare() {
	epatch_user
}

src_configure() {
	mycmakeargs=(
		-DDPKG_PROGRAM=""
		-DCMAKE_INSTALL_PREFIX="${GAMES_PREFIX}"
		-DDATAROOTDIR="${GAMES_DATADIR_BASE}"
		-DDATADIR="${GAMES_DATADIR}/${PN}"
		-DSYSCONFDIR="${GAMES_SYSCONFDIR}"/${PN}
		$(cmake-utils_use_build launcher LAUNCHER)
		$(cmake-utils_use_build opencs OPENCS)
		$(cmake-utils_use_build !minimal BSATOOL)
		$(cmake-utils_use_build !minimal ESMTOOL)
		$(cmake-utils_use_build !minimal MWINIIMPORTER)
		$(cmake-utils_use_with profile CODE_COVERAGE)
		-DUSE_SYSTEM_TINYXML=ON
		$(cmake-utils_use_build test UNITTESTS)
		)
	cmake-utils_src_configure
}

src_test() {
	pushd "${BUILD_DIR}" > /dev/null
	./openmw_test_suite || die
	popd > /dev/null
}

src_install() {
	cmake-utils_src_install
	rm -r "${D}"/usr/share/licenses
	sed -e "s:resources=resources:resources=${GAMES_DATADIR}/${PN}/resources:" \
		-i "${D}/${GAMES_SYSCONFDIR}"/${PN}/openmw.cfg || die
	prepgamesdirs
	# /etc/openmw/ is hardcoded, but we set SYSCONFDIR for games.eclass
	mv -t "${D}"/etc "${D}/${GAMES_SYSCONFDIR}"/${PN} || die
	rmdir "${D}/${GAMES_SYSCONFDIR}" || die
}
