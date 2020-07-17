# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/so-fancy/diff-so-fancy.git"
else
	HASH_COMMIT="v1.3.0"
	SRC_URI="https://github.com/so-fancy/diff-so-fancy/archive/${HASH_COMMIT}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Good-lookin' diffs. Actually... nah... The best-lookin' diffs."
HOMEPAGE="https://github.com/so-fancy/diff-so-fancy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""
DEPEND="
	${RDEPEND}
	dev-lang/perl
"

src_prepare() {
	sed -i 's|^use lib .*$|use lib "/usr/share/diff-so-fancy";|' diff-so-fancy || die "Sed failed!"
	eapply_user
}

src_install() {
	dobin "${PN}"

	insinto "/usr/share/${PN}"
	doins lib/*

	einstalldocs
}
