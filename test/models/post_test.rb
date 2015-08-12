require 'test_helper'



class PostTest < ActiveSupport::TestCase

	def setup
		@post = Post.new(title: "The world is mine", summary: "A brief journey through my life", body: "I was born and then things happened and now I am here test test test.", user_id: 1)
	end

	test "Post should be valid" do
		assert @post.valid?
	end

	test "title should be present" do
		@post.title = " "
		assert_not @post.valid?
	end
	test "summary should be present" do
		@post.summary = " "
		assert_not @post.valid?
	end
	test "body should be present" do
		@post.body = " "
		assert_not @post.valid?
	end
	test "user_id should be present" do
		@post.user_id = nil
		assert_not @post.valid?
	end

end