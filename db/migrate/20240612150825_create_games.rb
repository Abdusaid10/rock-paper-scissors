class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.references :user, null: false, foreign_key: true
      t.string :user_choice
      t.string :server_choice
      t.string :result

      t.timestamps
    end
  end
end
