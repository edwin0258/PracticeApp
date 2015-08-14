class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.string :title
    	t.text :summary
    	t.text :body
    	t.integer :sender_id
    	t.integer :receiver_id
    	t.timestamps null: false
    end
    add_index :messages, :sender_id
    add_index :messages, :receiver_id
    add_index :messages, [:sender_id, :receiver_id]
  end
end
