class Bar < ActiveRecord::Base
  def to_json(options={})
    {
        :name  => self.name,
        :fruit => "banana"
    }.to_json
  end
end
