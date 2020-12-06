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
  get 'get_board/:id', to: 'board#get'
  get 'get_board_name/:id', to: 'board#get_board_name'

  #lists CRUD
  post 'create_list', to: 'list#create'
  get 'get_list/:board_id', to: 'list#get'
  get 'get_list_name/:board_id', to: 'list#get_list_name'
  post 'delete_list', to: 'list#delete'
  post 'edit_list', to: 'list#edit'
  post 'archive_list', to: 'list#archive'
  post 'restore_list', to: 'list#restore'
  post 'move_list', to: 'list#move'

  #cards CRUD
  post 'create_card', to: 'card#create'
  get 'get_card/:board_id/:list_id', to: 'card#get'
  get 'get_board_cards/:board_id', to: 'card#get_all'
  get 'get_card_name/:board_id/:list_id', to: 'card#get_card_name'
  get 'get_card_deadline/:board_id/:list_id/:id', to: 'card#get_card_deadline'
  post 'delete_card', to: 'card#delete'
  post 'edit_card', to: 'card#edit'
  post 'archive_card', to: 'card#archive'
  post 'restore_card', to: 'card#restore'

  #card comments
  post 'create_comment', to: 'card_comment#create'
  post 'update_comment', to: 'card_comment#update'
  post 'delete_comment', to: 'card_comment#delete'
  get 'get_card_comment/:board_id/:list_id/:card_id/:id', to: 'card_comment#get'
  get 'get_card_comments/:board_id/:list_id/:card_id/', to: 'card_comment#get_all'
  
  #users 
  post 'create_user', to: 'user#create'
  post 'delete_user', to: 'user#delete'
  post 'edit_user', to: 'user#update'
  get 'get_user/:id', to: 'user#get'
  get 'get_current_user', to: 'user#get_current'
  delete 'logout', to: 'user#logout'
end
