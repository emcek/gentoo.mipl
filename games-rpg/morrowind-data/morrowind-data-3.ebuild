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

CHECKREQS_DISK_BUILD="622M"
CHECKREQS_DISK_USR="741M"

src_unpack() {
	if use main ; then
		cdrom_get_cds data1.cab

		unshield x /mnt/cdrom_mw/data1.cab || die "unpacking data1.cab failed!"
		unshield x /mnt/cdrom_mw/data2.cab || die "unpacking data2.cab failed!"
	fi

	if use bloodmoon ; then
		cdrom_get_cds data1.cab

		unshield x /mnt/cdrom_bm/data1.cab || die "unpacking data1.cab failed!"
		unshield x /mnt/cdrom_bm/data2.cab || die "unpacking data2.cab failed!"
	fi

	if use tribunal ; then
		cdrom_get_cds data1.cab

		unshield x /mnt/cdrom_tr/data1.cab || die "unpacking data1.cab failed!"
		unshield x /mnt/cdrom_tr/data2.cab || die "unpacking data2.cab failed!"
	fi
}

src_install() {
	if use main ; then
		insinto "${GAMES_DATADIR}"/${PN}
		doins -r /mnt/cdrom_mw/Video
		doins App_Executables/Morrowind.ini Data_Files/*
		doins -r Data_Files/Music
		doins -r Data_Files/Sound
		doins -r Data_Files/Splash
		doins -r Data_Files/Fonts
	fi

	if use bloodmoon ; then
		insinto "${GAMES_DATADIR}"/${PN}
		doins -r /mnt/cdrom_bm/Video
		doins App_Executables/Morrowind.ini Data_Files/*
		doins -r Data_Files/Music
		doins -r Data_Files/Sound
		doins -r Data_Files/Splash
		doins -r Data_Files/Fonts
	fi

	if use tribunal ; then
		insinto "${GAMES_DATADIR}"/${PN}
		doins -r /mnt/cdrom_tr/Video
		doins App_Executables/Morrowind.ini Data_Files/*
		doins -r Data_Files/Music
		doins -r Data_Files/Sound
		doins -r Data_Files/Splash
		doins -r Data_Files/Fonts
	fi

	prepgamesdirs
}
