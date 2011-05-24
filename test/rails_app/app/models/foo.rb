class Foo < ActiveRecord::Base
  def to_json(options={})
    {
      :name  => self.name,
      :array => ['from', 'code']
    }.to_json
  end
end
