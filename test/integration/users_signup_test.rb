require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # Invalid Password Information
  test "invalid user signup" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "newUser@gmail.com",
                                         password: "password",
                                         password_confirmation: "foo"
                                         }}
    end
    assert_template 'users/new'
  end
end
