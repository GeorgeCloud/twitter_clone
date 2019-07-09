require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # Validates Account is Created
  test "successful account creation" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "testName",
                                         email: "test@email.com",
                                         password: "testPassword",
                                         password_confirmation: "testPassword"
      }}
    end
    follow_redirect!
    assert_template 'users/show'
    # Expect flash is not empty
    assert_not flash.empty?
  end

  # Validates Account is not created with Invalid Data
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
    assert is_logged_in?
  end
end
