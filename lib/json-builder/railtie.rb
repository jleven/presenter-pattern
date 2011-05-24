require 'rails/railtie'
require 'json-builder/handler'

module JsonBuilder
  class Railtie < Rails::Railtie
    config.after_initialize do

      ActionView::Template.register_template_handler(:rjson, ::JsonBuilder::Handler)

    end
  end
end