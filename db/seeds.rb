# Limpa os registros existentes para evitar duplicatas
puts "Limpando registros existentes..."
ProfessorDisciplina.delete_all
Professor.delete_all
User.delete_all
Disciplina.delete_all
Departamento.delete_all

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

# Criando departamentos
departamentos_criados = {}
departamentos.each do |nome_departamento|
  dep = Departamento.create!(nome: nome_departamento)
  departamentos_criados[nome_departamento] = dep
  puts "Criando departamento: #{nome_departamento}"
end

puts "\nDepartamentos criados com sucesso!"
puts "Total de departamentos: #{Departamento.count}"

# Lista de professores com suas disciplinas
professores_data = [
  {
    nome: "João Silva",
    email: "joao.silva@prof.br", # Note o @prof.br para ser admin
    matricula: "P180001",
    username: "joao.silva",
    password: "prof123", # Mínimo 6 caracteres
    password_confirmation: "prof123",
    departamento: "Departamento de Ciência da Computação",
    formacao: "Doutor em Ciência da Computação",
    ocupacao: "Professor Adjunto",
    disciplinas: [ "Algoritmos e Programação de Computadores", "Estruturas de Dados" ]
  },
  {
    nome: "Maria Santos",
    email: "maria.santos@prof.br",
    matricula: "P180002",
    username: "maria.santos",
    password: "prof123",
    password_confirmation: "prof123",
    departamento: "Departamento de Matemática",
    formacao: "Doutora em Matemática",
    ocupacao: "Professora Associada",
    disciplinas: [ "Cálculo 1", "Álgebra Linear" ]
  },
  {
    nome: "Pedro Oliveira",
    email: "pedro.oliveira@prof.br",
    matricula: "P180003",
    username: "pedro.oliveira",
    password: "prof123",
    password_confirmation: "prof123",
    departamento: "Departamento de Ciência da Computação",
    formacao: "Doutor em Engenharia de Software",
    ocupacao: "Professor Adjunto",
    disciplinas: [ "Engenharia de Software", "Programação Concorrente" ]
  }
]

# Criando professores e suas disciplinas
professores_data.each do |prof_data|
  # Criar usuário para o professor
  user = User.create!(
    matricula: prof_data[:matricula],
    username: prof_data[:username],
    password: prof_data[:password],
    password_confirmation: prof_data[:password_confirmation],
    email: prof_data[:email],
  )

  # O role será definido automaticamente pelo email @prof.br
  # Definir o role do usuário
  user.role = user.email.end_with?("@prof.br") ? "admin" : "user"
  user.save!


  professor = Professor.create!(
    nome: prof_data[:nome],
    email: prof_data[:email],
    usuario: prof_data[:matricula],
    departamento: prof_data[:departamento],
    formacao: prof_data[:formacao],
    ocupacao: prof_data[:ocupacao]
  )


  # Criar disciplinas e associações
  prof_data[:disciplinas].each do |disc_nome|
    disciplina = Disciplina.find_or_create_by!(
      nome: disc_nome,
      codigo: "#{prof_data[:departamento][0..2]}#{rand(1000..9999)}",
      departamento: departamentos_criados[prof_data[:departamento]]
    )

    # Criar associação professor_disciplina
    ProfessorDisciplina.create!(
      professor: professor,
      disciplina: disciplina
    )

    puts "Criada disciplina #{disc_nome} para professor #{prof_data[:nome]}"
  end

  puts "Criado professor: #{prof_data[:nome]}"
end

# Criar um super admin
admin = User.new(
  username: "admin.master",
  matricula: "ADMIN001",
  password: "151515",
  password_confirmation: "151515",
  email: "admin.master@prof.br"
)
admin.role = admin.email.end_with?("@prof.br") ? "admin" : "user"
admin.save!

puts "\nSeed finalizada com sucesso!"
puts "Total de departamentos: #{Departamento.count}"
puts "Total de professores: #{Professor.count}"
puts "Total de disciplinas: #{Disciplina.count}"
puts "Total de associações professor-disciplina: #{ProfessorDisciplina.count}"
