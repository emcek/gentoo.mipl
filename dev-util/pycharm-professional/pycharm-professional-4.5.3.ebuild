# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit eutils versionator

SLOT="$(get_major_version)"
RDEPEND=">=virtual/jdk-1.6"

MY_PN="pycharm-professional"
MY_PV="$(get_version_component_range 4-6)"

RESTRICT="strip"
QA_TEXTRELS="opt/${P}/bin/libbreakgen.so"

DESCRIPTION="The Most Intelligent Python IDE (Professional Edition)"
HOMEPAGE="http://jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/python/${MY_PN}-${PV}.tar.gz"
LICENSE="Apache-2.0"
IUSE=""
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/${MY_PN}-IC-${MY_PV}"

src_install() {
	local dir="/opt/${P}"
	local exe="${PN}-${SLOT}"

	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}/bin/${MY_PN}.sh" "${dir}/bin/fsnotifier" "${dir}/bin/fsnotifier64"

	newicon "bin/${MY_PN}.png" "${exe}.png"
	make_wrapper "${exe}" "/opt/${P}/bin/${MY_PN}.sh"
	make_desktop_entry ${exe} "PyCharm ${PV} (Professional)" "${exe}" "Development;IDE"
}
