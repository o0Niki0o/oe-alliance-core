DESCRIPTION = "Sandman 28E vfd picons, edited by Ev0"
SECTION = "base"
PRIORITY = "required"
MAINTAINER = "Ev0/Sandman"
PACKAGE_ARCH = "${MACHINE_ARCH}"

require conf/license/openvix-gplv2.inc

SRCDATE = "20120204"
PV = "${SRCDATE}"
PR = "r2"
SETTINGS_FILENAME = "ev0.28e.vfd.picons"

SRC_URI = "http://enigma2.world-of-satellite.com/picons/${SETTINGS_FILENAME}_${PV}.tar.gz"

S = "${WORKDIR}/lcd_picon"

inherit autotools pkgconfig

PACKAGES = "${PN}"

FILES_${PN} = "/lcd_picon"

do_install() {
	install -d ${D}/lcd_picon
	install -m 0644 ${WORKDIR}/lcd_picon/*.* ${D}/lcd_picon
}

do_install_append() {
	find ${D}/lcd_picon/ -name 'picon_default.png' -exec rm {} \;
}

SRC_URI[md5sum] = "bdc5b1a45df447944c9a825a9ed92f88"
SRC_URI[sha256sum] = "bf84629c3113a3cc781e753f059b45e03bd4494c98b765b5505bbe5cdceea8ce"
