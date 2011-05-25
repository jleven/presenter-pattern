class Foo < ActiveRecord::Base
  validates_presence_of :name

  def to_json(options={})
    {
      :name  => self.name,
      :array => ['from', 'code']
    }.to_json
  end
end
