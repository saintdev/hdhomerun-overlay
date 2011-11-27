# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="${PN}_${PV//_/}"

DESCRIPTION="API for HDHomeRun networked TV tuner"
HOMEPAGE="http://www.silicondust.com<F11>"
SRC_URI="http://download.silicondust.com/hdhomerun/${MY_P}.tgz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

S="${WORKDIR}/${PN}"

DEPEND=""
RDEPEND=""

RESTRICT="primaryuri"

src_compile () {
	emake || die "Make failed"
}

src_install () {
	dobin hdhomerun_config
	dolib libhdhomerun.so
	dodoc README
	insinto /usr/include/libhdhomerun
	doins *.h
}
