# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

JAVA_PKG_WANT_BUILD_VM="oracle-jdk-bin-1.7"
JAVA_PKG_WANT_SOURCE="1.7"
JAVA_PKG_WANT_TARGET="1.7"

inherit multilib eutils java-pkg-2 java-ant-2

DESCRIPTION="Digital darkroom software"
HOMEPAGE="http://lightzoneproject.org/"
SRC_URI="http://www.hartwork.org/public/${P}.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEPEND="dev-java/javahelp:0
	dev-java/sun-jai-bin:0
	dev-java/substance:3.3"

DEPEND="${COMMON_DEPEND}
	dev-java/oracle-jdk-bin:1.7
	app-text/htmltidy"
RDEPEND="${COMMON_DEPEND}
	|| ( dev-java/oracle-jdk-bin:1.7 dev-java/oracle-jdk-bin:1.7 )"

_make_empty_jar() {
	local filename=${PWD}/$1

	mkdir "${T}"/META-INF || die
	( cd "${T}" && jar cf "${filename}" META-INF/ ) || die
	rmdir "${T}"/META-INF || die
}

src_prepare() {
	rm -R macosx windows || die

	epatch "${FILESDIR}"/${P}-*.patch

	# Workaround: Ensure valid UTF-8 input
	for i in \
			lightcrafts/src/com/lightcrafts/jai/opimage/RGBDemosaicOpImage.java \
			lightcrafts/src/com/lightcrafts/ui/toolkit/BoxedButton.java \
			lightcrafts/src/com/lightcrafts/ui/toolkit/DropShadowPanel.java \
			; do
		mv "${i}" "${i}".orig || die
		iconv -f iso-8859-1 -t utf-8 "${i}".orig > "${i}" || die
	done

	einfo ''
	einfo "Deleting shipped .so files:"
	einfo "$(find . -name '*.so' -print -delete | sort)"
	einfo ''
	einfo "Deleting bundled .jar files:"
	einfo "$(find . -name '*.jar' -print -delete | sort)"

	# Replace bundled files
	ln -s /usr/$(get_libdir)/sun-jai-bin/libmlib_jai.so linux/lib/libmlib_jai.so || die
	java-pkg_jar-from javahelp jh.jar linux/lib/jh.jar || die
	java-pkg_jar-from sun-jai-bin mlibwrapper_jai.jar linux/lib/mlibwrapper_jai.jar || die
	_make_empty_jar lightcrafts/lib/script-api.jar  # Included in Sun Java 6 already
	java-pkg_jar-from substance-3.3 substance-lite.jar lightcrafts/lib/substance-lite.jar || die

	java-pkg-2_src_prepare
}

src_compile() {
	for i in linux lightcrafts; do
		( cd ${i} && eant ) || die
	done
}

src_install() {
	local so_file_dir_dolib=/usr/$(get_libdir)/${PN}
	local so_file_dir=${so_file_dir_dolib}/$(get_libdir)

	java-pkg_dojar $(find -type f -name '*.jar') || die

	# Ensure our .so files are found
	cat <<-EOF > "${T}"/launcher_prelude
		export LD_LIBRARY_PATH='${so_file_dir}'
	EOF

	java-pkg_dolauncher \
			${PN} \
			--main com.lightcrafts.platform.linux.LinuxLauncher \
			-pre "${T}"/launcher_prelude \
			|| die

	dobin lightcrafts/products/LightZone-forkd || die

	# NOTE: This one goes last so we don't have to call "into" again
	into "${so_file_dir_dolib}"
	dolib.so $(find -type f -name '*.so') || die
}
