require 'rubygems'
require 'test/unit'
require 'active_support'

ENV['RAILS_ENV'] = 'test'
ENV['DB'] = 'postgresql'

require 'rails_app/config/environment'
require 'rails/test_help'

require 'yaml'
require 'active_record'
require 'logger'

require File.expand_path('../rails/init', File.dirname(__FILE__))

#def app
#  RailsApp::Application
#end
