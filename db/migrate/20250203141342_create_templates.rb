class CreateTemplates < ActiveRecord::Migration[7.2]
  def change
    create_table :templates do |t|
      t.string :nome
      t.string :semestre
      t.string :publicoAlvo

      t.timestamps
    end
  end
end
