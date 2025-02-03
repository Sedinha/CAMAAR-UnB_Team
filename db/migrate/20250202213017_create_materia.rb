class CreateMateria < ActiveRecord::Migration[7.2]
  def change
    create_table :materia do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
