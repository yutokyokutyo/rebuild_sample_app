require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.microposts.count.to_s, response.body
    assert_select 'div.pagination', count: 1
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end

  test "home display" do
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    # 1. user1に対して複数人がフォローする
    # 2. user1が複数人をフォローする
    # 3. followingとfollowerdsの数が意図した数になっているかを確認
  end
end
