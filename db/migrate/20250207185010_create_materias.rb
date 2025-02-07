class CreateMaterias < ActiveRecord::Migration[7.2]
  def change
    create_table :materias do |t|
      t.string :nome
      t.string :codigo
      t.references :departamento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
