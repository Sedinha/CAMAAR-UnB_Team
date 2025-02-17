class CreateRespondidos < ActiveRecord::Migration[7.2]
  def change
    create_table :respondidos do |t|
      t.references :questionario, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
