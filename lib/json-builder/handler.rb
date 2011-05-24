module JsonBuilder
  class Handler < ActionView::Template::Handler
    include ActionView::Template::Handlers::Compilable

    self.default_format = Mime::JSON

    def compile(template)
      "#{template.source}.to_json"
    end
  end
end
