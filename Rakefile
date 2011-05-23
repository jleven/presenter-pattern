require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('presenter-pattern', '0.1.0') do |p|
  p.description   = "Enables and enforces the presenter pattern in rails"
  p.url           = "https://github.com/jleven/presenter-pattern"
  p.author        = "Josh Leven"
  p.email         = "josh.leven@gmail.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }