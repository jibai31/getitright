Getitright::Application.routes.draw do

  resources :check_lists
  post 'check_list_definitions/:id/start', to: 'check_list_definitions#start', as: :start_check_list_definitions

  resources :task_definitions

  resources :check_list_definitions

  resource :check_list_definitions

  devise_for :users,
    controllers: {
      registrations: "registrations",
      omniauth_callbacks: "authentications"
    }

  root 'check_list_definitions#index'

end
