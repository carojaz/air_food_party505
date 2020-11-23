Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :device  #foodparty505/device/:id
  resource :rental   #foodparty505/rental/:id
end
