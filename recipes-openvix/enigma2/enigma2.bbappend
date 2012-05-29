FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PRINC = "1"

RDEPENDS_${PN} = " \
	python-email \
	python-mime \
	python-pyusb \
	python-subprocess \
	"

# ViX-Night-HD is the default skin.
DEFAULTSKIN = "enigma2-plugin-vix-night-hd"

PV = "2.8+git${SRCPV}"
PKGV = "2.8+git${GITPKGV}"
PR = "r0"

ENIGMA2_BRANCH ?= "master"
SRC_URI="git://git.assembla.com/openvix.2.git;protocol=git;branch=${ENIGMA2_BRANCH}"

SRC_URI_append_vuuno = " \
			file://enigma2_remote_keymap.patch \
			file://rc.png \
			file://rcold.png \
			file://rcpositions.xml \
			file://arrowup.png \
			file://arrowright.png \
			file://arrowleft.png \
			file://arrowdown.png \
			"

SRC_URI_append_vuultimo = " \
			file://enigma2_remote_keymap.patch \
			file://rc.png \
			file://rcold.png \
			file://rcpositions.xml \
			file://arrowup.png \
			file://arrowright.png \
			file://arrowleft.png \
			file://arrowdown.png \
			"

SRC_URI_append_vusolo = " \
			file://enigma2_remote_keymap.patch \
			file://rc.png \
			file://rcold.png \
			file://rcpositions.xml \
			file://arrowup.png \
			file://arrowright.png \
			file://arrowleft.png \
			file://arrowdown.png \
			"

SRC_URI_append_vuduo = " \
			file://enigma2_remote_keymap.patch \
			file://enigma2_VFD.patch \
			file://rc.png \
			file://rcold.png \
			file://rcpositions.xml \
			file://arrowup.png \
			file://arrowright.png \
			file://arrowleft.png \
			file://arrowdown.png \
			"

SRC_URI_append_et5x00 = " \
			file://enigma2_remote_keymap.patch \
			file://rc.png \
			file://rcold.png \
			file://rcpositions.xml \
			"

SRC_URI_append_et6x00 = " \
			file://enigma2_remote_keymap.patch \
			file://rc.png \
			file://rcold.png \
			file://rcpositions.xml \
			"

SRC_URI_append_et9x00 = " \
			file://enigma2_remote_keymap.patch \
			file://rc.png \
			file://rcold.png \
			file://rcpositions.xml \
			"

SRC_URI_append_gbhd800se = " \
			file://enigma2_remote_keymap.patch \
			file://rc.png \
			file://rcold.png \
			file://rcpositions.xml \
			"

SRC_URI_append_odinm9 = " \
			file://enigma2_remote_keymap.patch \
			file://rc.png \
			file://rcold.png \
			file://rcpositions.xml \
			"

SRC_URI_append_tmtwin = " \
			file://enigma2_remote_keymap.patch \
			file://rc.png \
			file://rcold.png \
			file://rcpositions.xml \
			file://rcpositions.xml \
			file://arrowup.png \
			file://arrowright.png \
			file://arrowleft.png \
			file://arrowdown.png \
			"

FILES_${PN} += " ${bindir}"
PACKAGES =+ "${PN}-po"

EXTRA_OECONF += "\
	--with-po \
	${@base_contains("MACHINE_FEATURES", "fullgraphiclcd", "--with-fullgraphiclcd" , "", d)} \
	"

# some plugins contain so's, their stripped symbols should not end up in the enigma2 package
FILES_${PN}-dbg += "\
	/usr/lib/enigma2/python/*/.debug \
	/usr/lib/enigma2/python/*/*/*.debug \
	/usr/lib/enigma2/python/*/*/*/.debug \
	/usr/lib/enigma2/python/*/*/*/*/.debug \
	"

# Save po files
FILES_${PN}-po = "${datadir}/enigma2/po/*.po"

def enigma2changeword(file):
	fn = file[:-1]
	os.system('sed -i "s/STB_BOX/' + MACHINE1 + '/g" ' + fn)

do_patch_prepend(){
	global MACHINE1
	if "${MACHINE}" == "vuuno":
		MACHINE1="Vu+ Uno"
	elif "${MACHINE}" == "vuultimo":
		MACHINE1="Vu+ Ultimo"
	elif "${MACHINE}" == "vusolo":
		MACHINE1="Vu+ Solo"
	elif "${MACHINE}" == "vuduo":
		MACHINE1="Vu+ Duo"
	elif "${MACHINE}" == "et5x00":
		MACHINE1="Xtrend ET5"
	elif "${MACHINE}" == "et6x00":
		MACHINE1="Xtrend ET6"
	elif "${MACHINE}" == "et9x00":
		MACHINE1="Xtrend ET9"
	elif "${MACHINE}" == "odinm9":
		MACHINE1="Odin M9"
	elif "${MACHINE}" == "gbhd800se":
		MACHINE1="GigaBlue HD800SE"
	elif "${MACHINE}" == "tmtwin":
		MACHINE1="Technomate"
	import os
	os.system("find ./ -name \"*.po\" > ./po_list")
	os.system("find ./ -name \"*.py\" >> ./po_list")
	os.system("find ./ -name \"*.xml\" >> ./po_list")
	po_list = []
	po_list = open('po_list','r+').readlines()
	for x in po_list:
		enigma2changeword(x)
	os.system('rm po_list')
}

do_compile_prepend_vuuno() {
	install -m 0644 ${WORKDIR}/rcpositions.xml ${S}/data/
	install -m 0644 ${WORKDIR}/rc.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/rcold.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowup.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowright.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowleft.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowdown.png ${S}/data/skin_default/
}

do_compile_prepend_vuultimo() {
	install -m 0644 ${WORKDIR}/rcpositions.xml ${S}/data/
	install -m 0644 ${WORKDIR}/rc.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/rcold.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowup.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowright.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowleft.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowdown.png ${S}/data/skin_default/
}

do_compile_prepend_vusolo() {
	install -m 0644 ${WORKDIR}/rcpositions.xml ${S}/data/
	install -m 0644 ${WORKDIR}/rc.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/rcold.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowup.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowright.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowleft.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowdown.png ${S}/data/skin_default/
}

do_compile_prepend_vuduo() {
	install -m 0644 ${WORKDIR}/rcpositions.xml ${S}/data/
	install -m 0644 ${WORKDIR}/rc.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/rcold.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowup.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowright.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowleft.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowdown.png ${S}/data/skin_default/
}

do_compile_prepend_et5x00() {
	install -m 0644 ${WORKDIR}/rcpositions.xml ${S}/data/
	install -m 0644 ${WORKDIR}/rc.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/rcold.png ${S}/data/skin_default/
}

do_compile_prepend_et6x00() {
	install -m 0644 ${WORKDIR}/rcpositions.xml ${S}/data/
	install -m 0644 ${WORKDIR}/rc.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/rcold.png ${S}/data/skin_default/
}

do_compile_prepend_et9x00() {
	install -m 0644 ${WORKDIR}/rcpositions.xml ${S}/data/
	install -m 0644 ${WORKDIR}/rc.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/rcold.png ${S}/data/skin_default/
}

do_compile_prepend_odinm9() {
	install -m 0644 ${WORKDIR}/rcpositions.xml ${S}/data/
	install -m 0644 ${WORKDIR}/rc.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/rcold.png ${S}/data/skin_default/
}

do_compile_prepend_tmtwin() {
	install -m 0644 ${WORKDIR}/rcpositions.xml ${S}/data/
	install -m 0644 ${WORKDIR}/rc.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/rcold.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowup.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowright.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowleft.png ${S}/data/skin_default/
	install -m 0644 ${WORKDIR}/arrowdown.png ${S}/data/skin_default/
}

def enigma2changeword2(file):
	fn = file[:-1]
	os.system('sed -i "s/' + MACHINE1 + '/STB_BOX/g" ' + fn)

python do_setup_po_ipk () {
	global MACHINE1
	if "${MACHINE}" == "vuuno":
		MACHINE1="Vu+ Uno"
	elif "${MACHINE}" == "vuultimo":
		MACHINE1="Vu+ Ultimo"
	elif "${MACHINE}" == "vusolo":
		MACHINE1="Vu+ Solo"
	elif "${MACHINE}" == "vuduo":
		MACHINE1="Vu+ Duo"
	elif "${MACHINE}" == "et5x00":
		MACHINE1="Xtrend ET5"
	elif "${MACHINE}" == "et6x00":
		MACHINE1="Xtrend ET6"
	elif "${MACHINE}" == "et9x00":
		MACHINE1="Xtrend ET9"
	elif "${MACHINE}" == "odinm9":
		MACHINE1="Odin M9"
	elif "${MACHINE}" == "gbhd800se":
		MACHINE1="GigaBlue HD800SE"
	elif "${MACHINE}" == "tmtwin":
		MACHINE1="Technomate"
	import os
	os.system("find ./ -name \"*.po\" > ./po_list")
	os.system("find ./ -name \"*.py\" >> ./po_list")
	os.system("find ./ -name \"*.xml\" >> ./po_list")
	po_list = []
	po_list = open('po_list','r+').readlines()
	for x in po_list:
		enigma2changeword2(x)
	os.system('rm po_list')
}

do_openpli_preinstall() {
	if [ -e ${S}/data/${RADIOMVI} ]; then
		ln -f ${S}/data/${RADIOMVI} ${S}/data/radio.mvi
		install -d ${D}${sysconfdir}/enigma2
	fi
}

do_install_append() {
	install -d ${D}/usr/share/keymaps
	find ${D}/usr/lib/enigma2/python/ -name '*.pyc' -exec rm {} \;
	find ${D}/usr/lib/enigma2/python/Plugins/ -name '*.py' -exec rm {} \;
}

do_install_po() {
	LANGS="ar bg ca cs da de el en en_GB es et fa fi fr fy he hr hu is it lt lv nl no pl pt ro ru sv sk sl sr th tr uk"
	for lang in ${LANGS}; do
		install -m 0755 ${S}/po/$lang.po ${D}${datadir}/enigma2/po/enigma2-$lang.po
	done
}

addtask setup_po_ipk before do_package after do_install
addtask install_po before do_package after do_setup_po_ipk

python populate_packages_prepend() {
	enigma2_plugindir = bb.data.expand('${libdir}/enigma2/python/Plugins', d)
	do_split_packages(d, enigma2_plugindir, '^(\w+/\w+)/[a-zA-Z0-9_]+.*$', 'enigma2-plugin-%s', '%s', recursive=True, match_path=True, prepend=True)
	do_split_packages(d, enigma2_plugindir, '^(\w+/\w+)/.*\.py$', 'enigma2-plugin-%s-src', '%s (source files)', recursive=True, match_path=True, prepend=True)
}
