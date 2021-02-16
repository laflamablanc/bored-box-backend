class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :address
      t.integer :zip
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
