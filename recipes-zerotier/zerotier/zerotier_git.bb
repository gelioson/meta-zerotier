SUMMARY = "Port Zerotier to Yocto"
HOMEPAGE = "https://github.com/zerotier/ZeroTierOne.git"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRCREV = "8e6e4ede6d17d1cf3c012269ab29e1c58568476e"
SRC_URI = "\
    git://github.com/zerotier/ZerotierOne;protocol=https;branch=dev \ 
"
# SRC_URI[sha256sum] = "337b579a32ac7e1414b5122cb26b57d88ba6fc4b57c346ba55de47eccaae0cd3"
TARGET_CC_ARCH += "${LDFLAGS}"

S = "${WORKDIR}/git"

do_compile() {
    make ZT_SSO_SUPPORTED=0
}

do_install(){
    install -d ${D}${bindir}
    install -m 0755 ${S}/zerotier-one ${D}${bindir}
}

# FILES_${PN} = "${bindir} ${sysconfdir}"
