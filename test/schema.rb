ActiveRecord::Schema.define(:version => 0) do
  create_table :foo, :force => true do |t|
    t.string :name
    t.string :squawk
  end
  create_table :bar, :force => true do |t|
    t.string :name
    t.string :tweet
    t.integer :foo_id
  end
end