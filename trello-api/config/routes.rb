Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  post 'authenticate', to: 'login#authenticate'

  get 'index', to: 'board#index'
  post 'create_board', to: 'board#create'
  post 'edit_board', to: 'board#edit'
  post 'delete_board', to: 'board#delete'
  post 'show_board', to: 'board#show'
end
