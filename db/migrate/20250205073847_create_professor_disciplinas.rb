class CreateProfessorDisciplinas < ActiveRecord::Migration[7.2]
  def change
    create_table :professor_disciplinas do |t|
      t.references :professor, null: false, foreign_key: true
      t.references :disciplina, null: false, foreign_key: true

      t.timestamps
    end
  end
end
