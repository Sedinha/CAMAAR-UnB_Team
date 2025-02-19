# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_02_04_175037) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.string "curso"
    t.string "matricula"
    t.string "usuario"
    t.string "formacao"
    t.string "ocupacao"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coordenadors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "departamento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_coordenadors_on_departamento_id"
    t.index ["user_id"], name: "index_coordenadors_on_user_id"
  end

  create_table "departamentos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disciplinas", force: :cascade do |t|
    t.string "codigo"
    t.string "nome"
    t.bigint "departamento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_disciplinas_on_departamento_id"
  end

  create_table "matriculas", force: :cascade do |t|
    t.bigint "aluno_id", null: false
    t.bigint "turma_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_matriculas_on_aluno_id"
    t.index ["turma_id"], name: "index_matriculas_on_turma_id"
  end

  create_table "professor_disciplinas", force: :cascade do |t|
    t.bigint "professor_id", null: false
    t.bigint "disciplina_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disciplina_id"], name: "index_professor_disciplinas_on_disciplina_id"
    t.index ["professor_id"], name: "index_professor_disciplinas_on_professor_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "nome"
    t.string "departamento"
    t.string "formacao"
    t.string "usuario"
    t.string "email"
    t.string "ocupacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questao_options", force: :cascade do |t|
    t.string "nome"
    t.text "texto"
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_questao_options_on_question_id"
  end

  create_table "questionarios", force: :cascade do |t|
    t.string "nome"
    t.bigint "turma_id", null: false
    t.bigint "template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_questionarios_on_template_id"
    t.index ["turma_id"], name: "index_questionarios_on_turma_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.integer "question_type", null: false
    t.text "content", null: false
    t.text "options"
    t.bigint "template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_questions_on_template_id"
  end

  create_table "respondidos", force: :cascade do |t|
    t.bigint "questionario_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionario_id"], name: "index_respondidos_on_questionario_id"
    t.index ["user_id"], name: "index_respondidos_on_user_id"
  end

  create_table "respostas", force: :cascade do |t|
    t.text "valor"
    t.bigint "question_id", null: false
    t.bigint "questionario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_respostas_on_question_id"
    t.index ["questionario_id"], name: "index_respostas_on_questionario_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "nome", null: false
    t.string "semestre", null: false
    t.string "publicoAlvo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turmas", force: :cascade do |t|
    t.string "codigo"
    t.string "semestre"
    t.string "horario"
    t.bigint "professor_id", null: false
    t.bigint "disciplina_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disciplina_id"], name: "index_turmas_on_disciplina_id"
    t.index ["professor_id"], name: "index_turmas_on_professor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "matricula", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["matricula"], name: "index_users_on_matricula", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "coordenadors", "departamentos"
  add_foreign_key "coordenadors", "users"
  add_foreign_key "disciplinas", "departamentos"
  add_foreign_key "matriculas", "alunos"
  add_foreign_key "matriculas", "turmas"
  add_foreign_key "professor_disciplinas", "disciplinas"
  add_foreign_key "professor_disciplinas", "professors"
  add_foreign_key "questao_options", "questions"
  add_foreign_key "questionarios", "templates"
  add_foreign_key "questionarios", "turmas"
  add_foreign_key "questions", "templates"
  add_foreign_key "respondidos", "questionarios"
  add_foreign_key "respondidos", "users"
  add_foreign_key "respostas", "questionarios"
  add_foreign_key "respostas", "questions"
  add_foreign_key "turmas", "disciplinas"
  add_foreign_key "turmas", "professors"
end
