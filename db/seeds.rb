# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Lista de departamentos da UnB que queremos adicionar inicialmente
departamentos = [
  "Departamento de Ciência da Computação",
  "Departamento de Engenharia Florestal",
  "Departamento de Matemática",
  "Departamento de Estatística",
  "Departamento de Engenharia Elétrica",
  "Departamento de Engenharia Civil",
  "Departamento de Física",
  "Departamento de Química",
  "Departamento de Biologia",
  "Departamento de Geografia"
]

# Criando os departamentos
departamentos.each do |nome_departamento|
  # find_or_create_by evita duplicatas caso o seed seja executado múltiplas vezes
  Departamento.find_or_create_by!(nome: nome_departamento) do |dep|
    puts "Criando departamento: #{nome_departamento}"
  end
end

puts "\nDepartamentos criados com sucesso!"
puts "Total de departamentos: #{Departamento.count}"
