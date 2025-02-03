class CreateStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :course
      t.string :registration
      t.string :username
      t.string :formation
      t.string :occupation
      t.string :email

      t.timestamps
    end
  end
end
