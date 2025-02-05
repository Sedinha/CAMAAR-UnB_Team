class CreateMatriculas < ActiveRecord::Migration[7.2]
  def change
    create_table :matriculas do |t|
      t.references :aluno, null: false, foreign_key: true
      t.references :turma, null: false, foreign_key: true

      t.timestamps
    end
  end
end
