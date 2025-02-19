Rails.application.routes.draw do
  root "home#index"

  resources :users, path: "signup", only: [ :new, :create ]
  # Rotas para criacao de usuario
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  post "/login", to: "home#create"

  # Rotas para admin
  get "admin/management", to: "admin#management"
  
  # Rotas de Login
  # get "/admin_login", to: "home#admin_login"
  # get "/user_login", to: "home#user_login"
  # post "/login", to: "sessions#create"
  #
  # Rotas de Logout
  # delete "/logout", to: "sessions#destroy"

  resources :templates
  resources :questionarios, only: [ :new, :create, :index, :show ]
  get "questionarios/results/:id", to: "questionarios#results", as: :questionario_results
  resources :respostas, only: [ :create ]

  get "admin/management", to: "admin#management"
  # Rotas para exportação de resultados
  get "export_results", to: "results#export"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # Rota para página de importação de arquivos
  get 'turmas/import_page', to: 'turmas#import_page', as: :import_turmas_page

  # Rotas para importação de arquivos
  post 'turmas/import', to: 'turmas#import', as: :import_turmas
  post 'turmas/import_members', to: 'turmas#import_members', as: :import_members_turmas

  # Rotas para banco de dados
  resources :turmas
  resources :professores
  resources :alunos
  resources :disciplinas
  resources :matriculas
  resources :professor_disciplinas


  # para dar logout
  delete "logout", to: "sessions#destroy"
end
