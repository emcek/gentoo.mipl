# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/pitivi/pitivi-0.15.2.ebuild,v 1.2 2013/09/05 18:58:06 mgorny Exp $

EAPI=5
GCONF_DEBUG="no"
PYTHON_COMPAT=( python2_7 )

inherit gnome2 python-single-r1 eutils virtualx multilib

DESCRIPTION="A non-linear video editor using the GStreamer multimedia framework"
HOMEPAGE="http://www.pitivi.org"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="v4l"

# Test fails by not finding audiosink ?
RESTRICT="test"

COMMON_DEPEND="
	>=dev-libs/gobject-introspection-1.34.0
	>=dev-python/gst-python-1.1.90:1.0
	dev-python/pycairo
	>=dev-python/pygobject-3.4.0
	>=dev-python/pygtk-2.18:2

	>=media-libs/clutter-1.12.0
	>=media-libs/gnonlin-1.1.90:1.0
	>=media-libs/gstreamer-1.2.0:1.0
	>=media-libs/gst-editing-services-1.1.90:1.0

	>=x11-libs/gtk+-3.8.0:3"
RDEPEND="${COMMON_DEPEND}
	dev-python/pyxdg

	v4l? ( media-plugins/gst-plugins-v4l2:1.0 )"
DEPEND="${RDEPEND}
	dev-python/setuptools
	sys-devel/gettext
	>=dev-util/intltool-0.35.5"

DOCS="AUTHORS NEWS RELEASE"

src_test() {
	# Force Xvfb to be used
	unset DISPLAY
	unset DBUS_SESSION_BUS_ADDRESS
	export PITIVI_TOP_LEVEL_DIR="${S}"
	Xemake check || die "tests failed"
}

src_install() {
	gnome2_src_install
	python_fix_shebang "${D}"
}
