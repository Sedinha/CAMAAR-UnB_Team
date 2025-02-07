class CreateTemplates < ActiveRecord::Migration[7.2]
  def change
    create_table :templates do |t|
      t.string :nome, null: false
      t.string :semestre, null: false
      t.string :publicoAlvo

      t.timestamps
    end
  end
end
