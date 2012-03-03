# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="2"

MY_P="${PN}_${PV//_/}"

DESCRIPTION="Graphical configuration tool for HDHomeRun networked TV tuners"
HOMEPAGE="http://www.silicondust.com"
SRC_URI="http://download.silicondust.com/hdhomerun/${MY_P}.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	=media-tv/libhdhomerun-${PV}
	x11-libs/gtk+:2"
RDEPEND=""

S="${WORKDIR}/${PN}"

RESTRICT="primaryuri"

src_prepare() {
	# We're going to install our libhdhomerun separately, need to change
	# references to it.
	sed -i -s "s:SUBDIRS = ../libhdhomerun src po:SUBDIRS = src po:g" \
		Makefile.in Makefile.am
	sed -i -s "s:\(-[IL]\)../../libhdhomerun:\1/usr/include/libhdhomerun:g" \
		src/Makefile.in src/Makefile.am
	sed -i -s -n "/libhdhomerun.so/!{p}" \
		src/Makefile.in src/Makefile.am
}

src_install () {
	dobin src/hdhomerun_config_gui
}
