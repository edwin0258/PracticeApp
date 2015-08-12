class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
    	t.boolean :favorite
    	t.integer :user_id, :post_id
    	t.timestamps
    end
  end
end
