class CreateBoxGames < ActiveRecord::Migration[6.0]
  def change
    create_table :box_games do |t|
      t.integer :box_id
      t.integer :game_id
      t.integer :rating
    end
  end
end
