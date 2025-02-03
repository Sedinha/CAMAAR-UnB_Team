class CreateClassInfos < ActiveRecord::Migration[7.2]
  def change
    create_table :class_infos do |t|
      t.string :code
      t.string :class_code
      t.string :semester

      t.timestamps
    end
  end
end
