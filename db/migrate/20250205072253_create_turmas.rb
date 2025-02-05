class CreateTurmas < ActiveRecord::Migration[7.2]
  def change
    create_table :turmas do |t|
      t.string :codigo
      t.string :semestre
      t.string :horario
      t.references :professor, null: false, foreign_key: true
      t.references :materia, null: false, foreign_key: true

      t.timestamps
    end
  end
end
