require 'test_helper'

class SetupTest < Test::Unit::TestCase
  load_schema

  def test_schema_has_loaded_correctly
    assert_equal [], Foo.all
    assert_equal [], Bar.all
  end

end
