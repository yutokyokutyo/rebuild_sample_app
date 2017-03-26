require 'test_helper'

class FooControllerTest < ActionDispatch::IntegrationTest
  test "should get bar" do
    get foo_bar_url
    assert_response :success
  end

  test "should get baz" do
    get foo_baz_url
    assert_response :success
  end

end
