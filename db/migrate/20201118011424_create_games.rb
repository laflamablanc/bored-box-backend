class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :image
      t.float :price
      t.integer :max_players
      t.integer :min_players
      t.integer :play_time
      t.string :description
      t.string :genre
      t.float :rating
      t.integer :rank
      t.integer :board_score
      t.integer :fantasy_score
      t.integer :players_score
    end
  end
end
