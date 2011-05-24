require 'rails/railtie'

require 'active_record'
require 'active_record/connection_adapters/postgresql_adapter'
require 'active_record/connection_adapters/mysql_adapter'
require 'active_record/connection_adapters/sqlite_adapter'

module PresenterPattern
  class IllegalDatabaseQueryFromView < RuntimeError; end

  class Railtie < Rails::Railtie
    initializer "presenter_pattern.raise_on_view_query" do |app|
      if Rails.env.development? || Rails.env.test?
        puts "[WARNING] Presenter::Rails is preventing your views from triggering PG, MySQL, SQLite3 or SQLite database connections."

        
        ::ActiveRecord::ConnectionAdapters.class_eval do

          %w(PostgreSQLAdapter MysqlAdapter SQLiteAdapter).each do |adapter_name|
            begin
              adapter = const_get adapter_name
              adapter.class_eval do
                alias :orig_execute :execute
                def execute(*args)
                  first_view   = caller.grep(/app\/views/).first
                  #first_helper = caller.grep(/app\/helpers/).first

                  # if we're coming from a view, let's analyze the situation
                  if !first_view.nil? #and (first_helper.nil? or (caller.index(first_view) < caller.index(first_helper)))
                    raise PresenterPattern::IllegalDatabaseQueryFromView, "No query from view prohibited, eager-load from a controller instead."
                  else
                    orig_execute *args
                  end
                end
              end
            rescue
              p "the adapter #{adapter_name} has not been instantiated"
            end
          end
        end


      end
    end
  end
end