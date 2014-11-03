# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

FONT_SUFFIX="otf"
FONT_PN="Inconsolata-dz"
S="${WORKDIR}"

inherit font

DESCRIPTION="A beautiful sans-serif monotype font designed for code listings"
HOMEPAGE="http://nodnod.net/2009/feb/12/adding-straight-single-and-double-quotes-inconsola/"
SRC_URI="http://media.nodnod.net/${FONT_PN}.${FONT_SUFFIX}.zip -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"
DEPEND="app-arch/unzip"
