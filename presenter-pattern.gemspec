# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{presenter-rails}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Leven"]
  s.date = %q{2011-05-23}
  s.description = %q{Enables and enforces the presenter pattern in rails}
  s.email = %q{josh.leven@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/presenter-rails.rb"]
  s.files = ["README.rdoc", "Rakefile", "lib/presenter-rails.rb", "Manifest", "presenter-rails.gemspec"]
  s.homepage = %q{https://github.com/jleven/presenter-rails}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Presenter-rails", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{presenter-rails}
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Enables and enforces the presenter pattern in rails}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
