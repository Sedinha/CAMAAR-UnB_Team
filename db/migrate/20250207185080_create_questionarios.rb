class CreateQuestionarios < ActiveRecord::Migration[7.2]
  def change
    create_table :questionarios do |t|
      t.string :nome
      t.references :turma, null: false, foreign_key: true
      t.references :template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
