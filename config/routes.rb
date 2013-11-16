Getitright::Application.routes.draw do
  
  resources :check_list_definitions

  resource :check_list_definitions
  
  devise_for :users,
    controllers: {
      registrations: "registrations",
      omniauth_callbacks: "authentications"
    }

  root 'check_list_definitions#index'
  
  

end
