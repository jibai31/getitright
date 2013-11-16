Getitright::Application.routes.draw do
  
<<<<<<< HEAD
  resources :check_lists
  post 'check_list_definitions/:id/start', to: 'check_list_definitions#start', as: :start_check_list_definitions   
=======
  resources :task_definitions
>>>>>>> 421c619fa07e2bb5bc7b700ef1062747b5c38f35

  resources :check_list_definitions

  resource :check_list_definitions
  
  devise_for :users,
    controllers: {
      registrations: "registrations",
      omniauth_callbacks: "authentications"
    }

  root 'check_list_definitions#index'
  
  

end
