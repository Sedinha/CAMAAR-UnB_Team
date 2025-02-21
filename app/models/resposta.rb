class Resposta < ApplicationRecord
  self.table_name = "respostas" #Não estava criando a tabela no banco de dados com o nome correto.

  belongs_to :questionario
  belongs_to :question

  validates :valor, :question_id, :questionario_id, presence: true #alteração feita para passar no teste estava questao.id e não question_id
end
