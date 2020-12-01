class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :address
      t.boolean :subscribed
      t.float :board_score
      t.float :party_score
      t.float :card_score
      t.float :fantasy_score
      t.float :economic_score
      t.float :territory_score
      t.float :players_score

    end
  end
end
