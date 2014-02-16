require_relative '../../lib/view_object'
require 'minitest/autorun'

class ViewObjectTest < MiniTest::Unit::TestCase

  def test_to_string_field_is_optional
    ViewObject.new({})
    pass('We did not explode')
  end

  def test_default_to_string_if_to_string_field_not_given
    view_obj = ViewObject.new({})
    assert_equal('#<ViewObject>', view_obj.to_s)
  end

  def test_empty_object_to_string_is_nil
    view_obj = ViewObject.new({},:none)
    assert_nil view_obj.to_s
  end

end