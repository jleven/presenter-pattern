require 'presenter-pattern/railtie'


# PresenterPattern::API enables and enforces very simple api controllers.
# Essentially, your controller has the settings:
#    layout nil
#    responds_to *formats    <--- formats is specified in step 1 below
#
# and each action ends with an implicit:
#    responds_with <return_value_from_action>
#
#
# 1. In your controller, include PresenterPattern::API, passing in the formats your api
#    will support using the bracket operator (defaults to :xml and :json)
#
#    e.g.    include PresenterPattern::API[:html, :json]
#
# 2. Each action must return the data you wish for your api to return.
#    Do NOT call render from within your actions.
#


module PresenterPattern
  module API
    class NoExplicitRender < RuntimeError; end

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
      host_class.layout nil
      host_class.respond_to *formats
      host_class.extend PresenterPattern::API::ClassMethods
    end

    # enforces simple api response
    #
    # each action must return the data meant for their response
    # 
    # - overwrites ActionController::Metal::ImplicitRender
    def send_action(method_name, *args)
      #call the action, and store return value
      @__rval = self.send(method_name, *args)

      #fail if action calls 'render'
      raise NoExplicitRender, "Controllers implementing the PresenterPattern::API must not call any render methods" if response_body

      #set the view variable
      name = self.class.instance_variable_get(:@view_var_name)
      name = name.pluralize if name && method_name.to_s == "index" #pluralize the @view_var_name if it was set at the class and this is GET/index
      @view_var_name = name || "data"

      #always follow responder pattern passing in the action's return value
      respond_with @__rval, (@respond_with_opts || {})
    end

    def respond_opts(options)
      @respond_with_opts ||= {}
      @respond_with_opts.merge! options
    end

    #only the @__rval variable (set in send_action) is passed through to the view
    def view_assigns
      {@view_var_name => @__rval}
    end
  end
end


