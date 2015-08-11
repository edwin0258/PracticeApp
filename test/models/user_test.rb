require 'test_helper'


class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Bob",username: "bob101", email: "Bob@gmail.com", password: "bob")
	end

	test "User Should be valid" do 
		assert @user.valid?
	end
	test "name should be present" do
		@user.name = " "
		assert_not @user.valid?
	end
	test "email should be present" do
		@user.email = " "
		assert_not @user.valid?
	end
	test "password should be present" do
		@user.password = " "
		assert_not @user.valid?
	end
	test "username should be present" do
		@user.username = " "
		assert_not @user.valid?
	end
	test "email address should be unique" do
		dub_user = @user.dup
		dub_user.email = @user.email.upcase
		@user.save
		assert_not dub_user.valid?
	end

end