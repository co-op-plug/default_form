# -*- encoding: utf-8 -*-
# stub: default_form 1.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "default_form".freeze
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["qinmingyuan".freeze]
  s.date = "2020-10-29"
  s.description = "Rails form builder that makes it easy to style forms".freeze
  s.email = ["mingyuan0715@foxmail.com".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze, "lib/default_form".freeze, "lib/default_form.rb".freeze, "lib/default_form/builder".freeze, "lib/default_form/builder/default.rb".freeze, "lib/default_form/builder/helper.rb".freeze, "lib/default_form/builder/wrap.rb".freeze, "lib/default_form/config.rb".freeze, "lib/default_form/controller_helper.rb".freeze, "lib/default_form/engine.rb".freeze, "lib/default_form/form_builder.rb".freeze, "lib/default_form/override".freeze, "lib/default_form/override/action_view".freeze, "lib/default_form/override/action_view/helpers".freeze, "lib/default_form/override/action_view/helpers/tags".freeze, "lib/default_form/override/action_view/helpers/tags/collection_check_boxes.rb".freeze, "lib/default_form/override/action_view/helpers/tags/collection_radio_buttons.rb".freeze, "lib/default_form/version.rb".freeze, "lib/default_form/view_helper.rb".freeze, "test/default_form_test.rb".freeze, "test/dummy".freeze, "test/test_helper.rb".freeze]
  s.homepage = "http://github.com/qinmingyuan/default_form".freeze
  s.licenses = ["LGPL-3.0".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Rails form builder with default UI".freeze
  s.test_files = ["test/test_helper.rb".freeze, "test/dummy".freeze, "test/default_form_test.rb".freeze]

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails_com>.freeze, ["~> 1.2"])
      s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<factory_bot_rails>.freeze, ["~> 4.11"])
    else
      s.add_dependency(%q<rails_com>.freeze, ["~> 1.2"])
      s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
      s.add_dependency(%q<factory_bot_rails>.freeze, ["~> 4.11"])
    end
  else
    s.add_dependency(%q<rails_com>.freeze, ["~> 1.2"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
    s.add_dependency(%q<factory_bot_rails>.freeze, ["~> 4.11"])
  end
end
