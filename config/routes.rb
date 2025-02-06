Rails.application.routes.draw do
  get "user/dashboard"
  get "admin/dashboard"
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Rotas para redirecionamento após login

  #Rota da administração
  get "/admin_dashboard", to: "admin#dashboard"

  #Rota do usuário
  get "/user_dashboard", to: "user#dashboard"

  # Rotas de Login a serem implementadas
  post "/login_user", to: "sessions#create_user"
  post "/login_admin", to: "sessions#create_admin"

  # Rotas de Logout
  delete "/logout", to: "sessions#destroy"

  resources :templates

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # Rotas para banco de dados
  resources :turmas
  resources :professores
  resources :alunos
  resources :disciplinas
  resources :matriculas
  resources :professor_disciplinas

  # Rotas para upload de arquivos
  resources :turmas do
    collection { post :import }
    collection { post :import_members }
  end

end
