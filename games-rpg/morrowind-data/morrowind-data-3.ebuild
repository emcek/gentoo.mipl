# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI=5

inherit cdrom check-reqs games

DESCRIPTION="The Elder Scrolls III: Morrowind - data extractor"
HOMEPAGE="http://www.elderscrolls.com/"
SRC_URI=""

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+main bloodmoon tribunal"

RESTRICT="bindist mirror"

RDEPEND="games-engines/openmw"
DEPEND="app-arch/unshield"

S=${WORKDIR}

CHECKREQS_DISK_BUILD="1900M"
CHECKREQS_DISK_USR="900M"

src_unpack() {
	if use main ; then
		cdrom_get_cds data1.cab

		unshield x "${CDROM_ROOT}"/data1.cab || die "unpacking data1.cab failed!"
		unshield x "${CDROM_ROOT}"/data2.cab || die "unpacking data2.cab failed!"
	fi

	if use bloodmoon ; then
		cdrom_load_next_cd
		cdrom_get_cds data1.cab

		unshield x "${CDROM_ROOT}"/data1.cab || die "unpacking data1.cab failed!"
		unshield x "${CDROM_ROOT}"/data2.cab || die "unpacking data2.cab failed!"
	fi

	if use tribunal ; then
		cdrom_load_next_cd
		cdrom_get_cds data1.cab

		unshield x "${CDROM_ROOT}"/data1.cab || die "unpacking data1.cab failed!"
		unshield x "${CDROM_ROOT}"/data2.cab || die "unpacking data2.cab failed!"
	fi
}

src_install() {
	if use main ; then
		insinto "${GAMES_DATADIR}"/${PN}
		cdrom_load_next_cd
		doins -r "${CDROM_ROOT}"/Video
		doins App_Executables/Morrowind.ini Data_Files/*
		doins -r Data_Files/Music Data_Files/Sound Data_Files/Splash Data_Files/Fonts
	fi

	if use bloodmoon ; then
		insinto "${GAMES_DATADIR}"/${PN}
		doins App_Executables/Morrowind.ini Data_Files/*
		doins -r Data_Files/Music Data_Files/Sound Data_Files/Splash Data_Files/Fonts
	fi

	if use tribunal ; then
		insinto "${GAMES_DATADIR}"/${PN}
		doins App_Executables/Morrowind.ini Data_Files/*
		doins -r Data_Files/Music Data_Files/Sound Data_Files/Splash Data_Files/Fonts
	fi

	prepgamesdirs
}
