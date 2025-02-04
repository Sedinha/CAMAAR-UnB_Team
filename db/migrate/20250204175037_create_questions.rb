class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.integer :question_type, null: false
      t.text :content, null: false
      t.text :options
      t.references :template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
