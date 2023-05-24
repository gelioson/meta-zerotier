FILESEXTRAPATHS:prepend := "${THISDIR}/initscripts-1.0:"

SRC_URI:append = " \
file://zerotier-startup.sh \
file://zerotier-control.sh \
"
do_install:append () {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/zerotier-control.sh ${D}${bindir}
    install -m 0755    ${WORKDIR}/zerotier-startup.sh     ${D}${sysconfdir}/init.d

    update-rc.d -r ${D} zerotier-startup.sh start 199 2 3 4 5 .
}

do_zertorier_config() {
    sed -i 's/_ZEROTIER_NETWORK_ID_/${ZEROTIER_NETWORK_ID}/g' ${D}${bindir}/zerotier-control.sh
}

addtask do_zertorier_config after do_install before do_package

MASKED_SCRIPTS:append = " \
zerotier-startup \
"

RDEPENDS:${PN} += " bash cronie"
