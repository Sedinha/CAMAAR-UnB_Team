class CreateTeachers < ActiveRecord::Migration[7.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :department
      t.string :formation
      t.string :username
      t.string :email
      t.string :occupation
      t.references :class_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end
