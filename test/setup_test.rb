require 'test_helper'

require 'foo'
require 'bar'

class SetupTest < Test::Unit::TestCase

  def test_schema_has_loaded_correctly
    assert_equal [], Foo.all
    assert_equal [], Bar.all
  end

end
