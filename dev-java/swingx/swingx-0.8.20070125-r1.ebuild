# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils java-pkg-2

DESCRIPTION="SwingLabs Swing Component Extensions"
HOMEPAGE="http://java.net/projects/swingx"
SRC_URI="http://www.hartwork.org/public/${P}.tar.xz"
# i.e. a snapshot of https://svn.java.net/svn/swingx~svn/tags/jw_before_default_swingx_renderer_25jan2007/

LICENSE="|| ( LGPL-2.1 BSD ) Apache-2.0"
SLOT="0.8"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEPEND="dev-java/swing-worker:0
	dev-java/batik:1.7"

DEPEND=">=virtual/jdk-1.5 ${COMMON_DEPEND}"
RDEPEND=">=virtual/jre-1.5 ${COMMON_DEPEND}"

S=${WORKDIR}/jw_before_default_swingx_renderer_25jan2007

src_compile() {
	epatch "${FILESDIR}"/${P}-SubstanceMonthViewUI.patch

	local swing_worker_jar=$(java-pkg_getjar swing-worker swing-worker.jar)
	local batik_jar=$(java-pkg_getjar batik-1.7 batik-all.jar)

	find . -type f -name '*.java' | fgrep -v /src/test/ | while read i ; do
		local source=${i##./}
		local binary=${source%%.java}.class
		[[ -e "${binary}" ]] && continue

		echo "  JAVAC   ${binary}"
		ejavac -classpath "src/java/:src/beaninfo/:${swing_worker_jar}:${batik_jar}" "${i}" || die
	done
}

src_install() {
	local jar_input=jar_input

	find -type f \( \
			-name '*.class' \
			-o -name '*.gif' \
			-o -name '*.png' \
			-o -name '*.html' \
			-o -name '*.properties' \) \
			| fgrep -v /src/test/ | while read i ; do
		local dir_part="$(dirname "${i}" | sed 's,^\./src/[^/]\+/,,')"
		mkdir -p "${jar_input}/${dir_part}" || die
		cp --no-clobber "${i}" "${jar_input}/${dir_part}/" || die
	done

	( cd "${jar_input}" && jar cf ../${PN}.jar . ) || die
	java-pkg_dojar ${PN}.jar || die
}
