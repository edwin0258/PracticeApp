require 'test_helper'




class FavoriteTest < ActiveSupport::TestCase
	def setup
		@favorite = Favorite.create(favorite: true, user_id: 1, post_id: 2)
	end

	test "Favorite should be valid" do
		assert @favorite.valid?
		
	end

	test "favorite should be present" do
		@favorite.favorite = " "
		assert_not @favorite.valid?
	end
	test "user should be present" do
		@favorite.user_id = " "
		assert_not @favorite.valid?
	end
	test "post should be present" do
		@favorite.post_id = " "
		assert_not @favorite.valid?
	end

end