class CreateClasses < ActiveRecord::Migration[7.2]
  def change
    create_table :classes do |t|
      t.string :class_code
      t.string :semester
      t.string :time

      t.timestamps
    end
  end
end
