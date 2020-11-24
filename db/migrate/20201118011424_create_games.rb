class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :image
      t.float :price
      t.integer :players
      t.float :rating
      t.integer :rank
    end
  end
end