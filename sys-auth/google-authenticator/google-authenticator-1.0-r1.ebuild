# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit eutils toolchain-funcs pam

DESCRIPTION="PAM Module for two step verification via mobile platform"
HOMEPAGE="http://code.google.com/p/google-authenticator/"
SRC_URI="http://${PN}.googlecode.com/files/libpam-${P}-source.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="qrcode"

DEPEND="virtual/pam"

RDEPEND="${DEPEND}
	qrcode? ( media-gfx/qrencode )"

RESTRICT="test"
# Test fails with:
# pam_google_authenticator_unittest:
#	pam_google_authenticator_unittest.c:317: 
#	main: Assertion `pam_sm_open_session(((void *)0), 0, targc, targv) == 0' failed.
#
# No user name available when checking verification code

S=${WORKDIR}/libpam-${P}

src_prepare(){
	epatch "${FILESDIR}"/${P}-Makefile.patch
	tc-export CC
}

src_install(){
	dopammod pam_google_authenticator.so
	dobin google-authenticator
	dodoc README
	dohtml totp.html
}

pkg_postinst(){
	elog "For further information see"
	elog "http://wiki.gentoo.org/wiki/Google_Authenticator"
}
