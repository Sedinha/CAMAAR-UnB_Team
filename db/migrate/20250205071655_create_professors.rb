class CreateProfessors < ActiveRecord::Migration[7.2]
  def change
    create_table :professors do |t|
      t.string :nome
      t.string :departamento
      t.string :formacao
      t.string :usuario
      t.string :email
      t.string :ocupacao

      t.timestamps
    end
  end
end
