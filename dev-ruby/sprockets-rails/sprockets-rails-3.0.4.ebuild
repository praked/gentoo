# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem versionator

DESCRIPTION="Sprockets implementation for Rails 4.x (and beyond) Asset Pipeline"
HOMEPAGE="https://github.com/rails/sprockets-rails"
SRC_URI="https://github.com/rails/sprockets-rails/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(get_version_component_range 1)"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux"

IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/actionpack-4.0:*
	>=dev-ruby/activesupport-4.0:*
	dev-ruby/sprockets:3"

ruby_add_bdepend "
	test? (
		>=dev-ruby/actionpack-4
		>=dev-ruby/railties-4
		dev-ruby/test-unit:2
	)"

all_ruby_prepare() {
	# Help load correct rack version consistently
	sed -i -e "3irequire 'action_controller'" test/test_helper.rb || die
}
