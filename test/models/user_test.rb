require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Doe", email: "JaneDoe@gmail.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email should not exceed 255 characters" do
    @user.email = "@" * 256
    assert_not @user.valid?
  end

  test "name should not exceed 30 characters" do
    @user.name = "@" * 31
    assert_not @user.valid?
  end

  test "email validation" do
    addresses = %w[user@ser+ver.com user+name@@server.com]
    addresses.each do |email|
      @user.email = email
      assert_not @user.valid?, "#{email.inspect} should be invalid"
    end
  end
end
