require 'test_helper'


class CommentTest < ActiveSupport::TestCase

	def setup
		@comment = Comment.create(title: "Nice Post", body: "This is very good!!", user_id: 1, post_id: 3)
	end

	test "Comment should be valid" do
		assert @comment.valid?
		
	end
	test "title should be present" do
		@comment.title = " "
		assert_not @comment.valid?
	end
	test "body should be present" do
		@comment.body = " "
		assert_not @comment.valid?
	end
	test "user should be present" do
		@comment.user_id = " "
		assert_not @comment.valid?
	end
	test "post should be present" do
		@comment.post_id = " "
		assert_not @comment.valid?
	end

end