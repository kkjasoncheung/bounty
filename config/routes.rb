Rails.application.routes.draw do
  resources :forums do
    resources :comments
  end
  get 'public/index'

  get 'public/profile'

  get 'public/messages_inbox'

  get 'public/requests_inbox'

  get 'public/send_request'

  get 'index/:data' => 'public#index'

  match 'forums/:user_id/new' => 'forums#new', :via => :post


  resources :schools
  resources :tags
  resources :comments
  resources :posts do
    resources :requests
  end
  resources :requests
  resources :messages
  resources :users



  root 'public#index'

  match ':controller(/:action(/:id))', :via=>[:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
