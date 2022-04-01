class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :introduction
      t.string :game_name
      t.string :various_id

      t.timestamps
    end
  end
end
