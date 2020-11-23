class CreateUserLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_likes do |t|
      t.integer :user_id
      t.integer :game_id

    end
  end
end
