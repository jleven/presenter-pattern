ENV['RAILS_ENV'] = 'test'
#ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/../../../..'
#ENV['DB'] = 'postgresql'

$LOAD_PATH.unshift '.test'
$LOAD_PATH.unshift './test/app/controllers'

require 'config/application'
require 'rails/test_help'

Presenter::Rails::Application.initialize!

require 'application_controller'
ApplicationController.append_view_path "test/app/views"

require 'test/unit'
require 'yaml'
require 'active_record'
require 'action_controller'
require 'logger'

def load_schema
  config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
  ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")

  db_adapter = ENV['DB']

  # no db passed, try one of these fine config-free DBs before bombing.
  db_adapter ||=
    begin
      require 'rubygems'
      require 'sqlite'
      'sqlite'
    rescue MissingSourceFile
      begin
        require 'sqlite3'
        'sqlite3'
      rescue MissingSourceFile
      end
    end

  if db_adapter.nil?
    raise "No DB Adapter selected. Pass the DB= option to pick one, or install Sqlite or Sqlite3."
  end

  ActiveRecord::Base.establish_connection(config[db_adapter])
  load(File.dirname(__FILE__) + "/schema.rb")
  require File.dirname(__FILE__) + '/../rails/init'
end

class Foo < ActiveRecord::Base
  has_many :bars
end

class Bar < ActiveRecord::Base
  belongs_to :foo
end
