require 'rails/railtie'


module PresenterPattern
  class IllegalDatabaseQueryFromView < RuntimeError; end

  class Railtie < Rails::Railtie
    config.after_initialize do

      if Rails.env.development? || Rails.env.test?

        adapters = begin
          ::ActiveRecord::ConnectionAdapters::AbstractAdapter.subclasses
        rescue
          #ActiveRecord not loaded
          []
        end
        
        if adapters.any?

          puts "\n[WARNING] PresenterPattern is preventing your views from triggering a database query through the following adapters:"
          adapters.map{|a| a.name.split('::').last}.each {|name| puts "  * #{name}"}
          puts

          adapters.each do |adapter|
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
          end
          
        end

      end
      
    end
  end
end