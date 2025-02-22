class AddPublicoAlvoToQuestionarios < ActiveRecord::Migration[7.2]
  def change
    add_column :questionarios, :publico_alvo, :string
  end
end
