# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils java-pkg-2 java-ant-2

SUBX_P=${PN}-swingx-${PV}

DESCRIPTION="Swing look-and-feel library"
HOMEPAGE="https://github.com/kirillcool/substance"
SRC_URI="http://www.hartwork.org/public/${P}.tar.xz
	http://www.hartwork.org/public/${SUBX_P}.tar.xz"
# i.e. a snapshot of https://svn.java.net/svn/substance~svn/tags/release_3_3_japan/
# .. and https://svn.java.net/svn/substance-swingx~svn/tags/release_3_3_japan/

LICENSE="|| ( LGPL-2.1 BSD ) BSD CC-BY-SA-2.5 public-domain"  # TODO have a closer look
SLOT="3.3"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEPEND="dev-java/laf-widget:3.0
	dev-java/laf-plugin:1.0
	dev-java/asm:2.2
	dev-java/jgoodies-forms:0
	dev-java/swingx:1.6"

DEPEND=">=virtual/jdk-1.7 ${COMMON_DEPEND}"
RDEPEND=">=virtual/jre-1.7 ${COMMON_DEPEND}"

S=${WORKDIR}

src_prepare() {
	epatch "${FILESDIR}"/${P}-build-xml.patch
	epatch "${FILESDIR}"/${SUBX_P}-SubstanceMonthViewUI.patch

	einfo "Deleting bundled .jar files..."
	einfo "$(find -type f -name '*.jar' -delete -print | sort)"

	java-pkg_jar-from laf-widget-3.0 laf-widget.jar ${P}/lib/laf-widget.jar || die
	java-pkg_jar-from laf-plugin-1.0 laf-plugin.jar ${P}/lib/laf-plugin-50.jar || die
	java-pkg_jar-from asm-2.2 asm.jar ${P}/lib/asm.jar || die
	java-pkg_jar-from asm-2.2 asm-commons.jar ${P}/lib/asm-commons.jar || die
	java-pkg_jar-from jgoodies-forms forms.jar ${P}/lib/forms.jar || die
	java-pkg_jar-from swingx-0.8 swingx.jar ${P}/lib/swingx.jar || die

	# Bypass ant for substance-swingx
	rm ${SUBX_P}/build.xml || die

	# Fix java home
	sed \
		-e 's|\(<property name="jdk\.home\.java_version_1\.7\.0" value="\)[^"]\+\(" />\)|\1'"${JAVA_HOME}\2|" \
		-i ${P}/build.xml || die

	# Remove hard-coded memory limits
	sed \
		-e 's|memoryMaximumSize="[^"]*" *||g' \
		-i ${P}/build.xml || die

	# Workaround: Ensure valid UTF-8 input
	for i in \
			${P}/src/contrib/net/xoetrope/editor/color/ColorWheelPanel.java \
			${P}/src/test/check/AKDockLayout.java \
			; do
		mv "${i}" "${i}".orig || die
		iconv -f iso-8859-1 -t utf-8 "${i}".orig > "${i}" || die
	done
}

src_compile() {
	local swingx_jar=$(java-pkg_getjar swingx-0.8 swingx.jar)
	local laf_widget_jar=$(java-pkg_getjar laf-widget-3.0 laf-widget.jar)
	local laf_plugin_jar=$(java-pkg_getjar laf-plugin-1.0 laf-plugin.jar)

	# Compile substance-swing code
	find "${SUBX_P}" -type f -name '*.java' | fgrep -v /src/test/ | while read i ; do
		local source=${i##./}
		local binary=${source%%.java}.class
		[[ -e "${binary}" ]] && continue

		echo "  JAVAC   ${binary}"
		ejavac -sourcepath "${P}/src/" -classpath "${swingx_jar}:${laf_widget_jar}:${laf_plugin_jar}" "${i}" || die
	done

	# Build substance-swing .jar
	( cd "${SUBX_P}"/src \
			&& jar cf "${S}"/${PN}-swingx.jar META-INF $(find . -type f -name '*.class') \
			) || die

	# Build substance
	( cd ${P} && eant -verbose ) || die
}

src_install() {
	java-pkg_dojar $(find -type f -name '*.jar') || die
}
