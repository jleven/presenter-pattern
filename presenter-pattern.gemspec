# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{presenter-pattern}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Leven"]
  s.date = %q{2011-05-25}
  s.description = %q{Enables and enforces the presenter pattern in rails}
  s.email = %q{josh.leven@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/json-builder/handler.rb", "lib/json-builder/railtie.rb", "lib/presenter-pattern.rb", "lib/presenter-pattern/railtie.rb"]
  s.files = ["README.rdoc", "Rakefile", "lib/json-builder/handler.rb", "lib/json-builder/railtie.rb", "lib/presenter-pattern.rb", "lib/presenter-pattern/railtie.rb", "rails/init.rb", "test/json_responder_test.rb", "test/json_view_test.rb", "test/no_querying_view_test.rb", "test/only_data_in_view_test.rb", "test/setup_test.rb", "test/test_helper.rb", "Manifest", "presenter-pattern.gemspec"]
  s.homepage = %q{https://github.com/jleven/presenter-pattern}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Presenter-pattern", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{presenter-pattern}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Enables and enforces the presenter pattern in rails}
  s.test_files = ["test/no_querying_view_test.rb", "test/only_data_in_view_test.rb", "test/setup_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
