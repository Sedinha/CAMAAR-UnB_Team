class CreateRespostas < ActiveRecord::Migration[7.2]
  def change
    create_table :respostas do |t|
      t.text :valor
      t.references :question, null: false, foreign_key: true
      t.references :questionario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
