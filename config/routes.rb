Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  post 'authenticate', to: 'login#authenticate'

  get 'index', to: 'board#index'

  #boards CRUD
  post 'create_board', to: 'board#create'
  post 'edit_board', to: 'board#edit'
  post 'delete_board', to: 'board#delete'
  post 'archive_board', to: 'board#archive'
  post 'restore_board', to: 'board#restore'
  get 'get_board', to: 'board#get'

  #lists CRUD
  post 'create_list', to: 'list#create'
  get 'get_list/:board_id', to: 'list#get'
  post 'delete_list', to: 'list#delete'
  post 'edit_list', to: 'list#edit'

  #cards CRUD
  post 'create_card', to: 'card#create'
  get 'get_card/:board_id/:list_id', to: 'card#get'
  post 'delete_card', to: 'card#delete'
  post 'edit_card', to: 'card#edit'
end
