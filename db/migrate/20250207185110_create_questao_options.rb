class CreateQuestaoOptions < ActiveRecord::Migration[7.2]
  def change
    create_table :questao_options do |t|
      t.string :nome
      t.text :texto
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
