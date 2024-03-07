Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "landing_pages#index"

  resources :professionals, path: "profissionais"
  resources :customers, path: "clientes", path_names: { new: "cadastrar" }
  resources :services, path: "servicos"

  namespace :admin do
    resources :professionals, path: "gerenciar_profissionais"
  end

  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create', as: :login_post
  delete 'logout', to: 'user_sessions#destroy'
end
