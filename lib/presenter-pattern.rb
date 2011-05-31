require 'presenter-pattern/railtie'

# PresenterPattern::API enables and enforces very simple api controllers.
# Essentially, your controller has the settings:
#    layout nil
#    responds_to *formats    <--- formats is specified in step 1 below
#
# and each action ends with an implicit:
#    responds_with <return_value_from_action>
# unless response created explicitly
#
# 1. In your controller, include PresenterPattern::API, passing in the formats your api
#    will support using the bracket operator (defaults to :xml and :json)
#
#    e.g.    include PresenterPattern::API[:html, :json]
#
# 2. Each action must return the data you wish for your api to return.
#


module PresenterPattern
  module API
    def self.[](*formats)
      custom_api = self.dup
      custom_api.class_eval do
        define_singleton_method :included do |host_class|
          do_included(host_class, *formats)
        end
      end
      custom_api
    end
    
    def self.included(host_class)
      do_included(host_class, :xml, :json)
    end

    module ClassMethods
      def view_var_name(name)
        @view_var_name = name.to_s
      end
    end

    def self.do_included(host_class, *formats)
      host_class.respond_to *formats
      host_class.extend PresenterPattern::API::ClassMethods
    end

    # enforces simple api response
    #
    # each action must return the data meant for their response
    # 
    # - this overwrites ActionController::Metal::ImplicitRender
    def send_action(method_name, *args)
      #call the action, and store return value
      rval = self.send(method_name, *args)

      unless response_body
        #set the view variable with the return value
        name = self.class.instance_variable_get(:@view_var_name)
        name = name.pluralize if name && method_name.to_s == "index" #pluralize the @view_var_name if it was set at the class and this is GET/index
        name ||= "data"
        self.instance_variable_set :"@#{name}", rval

        #always follow responder pattern passing in the action's return value unless already rendered
        respond_with rval, (@respond_opts || {})
      end
    end

    def respond_opts(options)
      @respond_opts ||= {}
      @respond_opts.merge! options
    end
  end
end


