class CreateDisciplinas < ActiveRecord::Migration[7.2]
  def change
    create_table :disciplinas do |t|
      t.string :codigo
      t.string :nome
      t.references :departamento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
