# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="Gnonlin is a set of GStreamer elements to ease the creation of non-linear multimedia editors."
HOMEPAGE="http://gnonlin.sourceforge.net"
SRC_URI="http://gstreamer.freedesktop.org/src/${PN}/${P}.tar.xz"

LICENSE="LGPL-2"
SLOT="1.0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND=">=dev-libs/glib-2.34
	>=media-libs/gstreamer-1.2.0:1.0
	=media-libs/gst-plugins-base-1.2.0:1.0"
DEPEND="${RDEPEND}
		virtual/pkgconfig
		doc? ( || (
			>=dev-util/gtk-doc-am-1.13
			>=dev-util/gtk-doc-1.3 ) )
		test? ( dev-libs/check
				media-libs/gst-plugins-good:1.0 )" # videomixer

src_configure() {
		econf \
				$(use_enable doc gtk-doc) \
				$(use_enable doc docbook)
}

src_install() {
		emake DESTDIR="${D}" install || die "emake install failed."
		dodoc AUTHORS ChangeLog NEWS README RELEASE
}
