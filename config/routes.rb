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
  post 'archive_list', to: 'list#archive'
  post 'restore_list', to: 'list#restore'
  post 'move_list', to: 'list#move'

  #cards CRUD
  post 'create_card', to: 'card#create'
  get 'get_card/:board_id/:list_id', to: 'card#get'
  post 'delete_card', to: 'card#delete'
  post 'edit_card', to: 'card#edit'
  post 'archive_card', to: 'card#archive'
  post 'restore_card', to: 'card#restore'

  #users 
  post 'create_user', to: 'user#create'
  post 'delete_user', to: 'user#delete'
  post 'edit_user', to: 'user#update'
  get 'get_user/:id', to: 'user#get'
end
