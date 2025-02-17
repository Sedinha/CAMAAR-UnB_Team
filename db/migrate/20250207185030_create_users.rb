class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :matricula, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :role, default: 0
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :users, :matricula, unique: true
  end
end
