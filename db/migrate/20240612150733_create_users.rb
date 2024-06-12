class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, index: true

      t.timestamps
    end

    add_index :users, :name, unique: true
  end
end
