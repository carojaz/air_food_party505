Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :devices  #foodparty505/device/
  resource :rentals do #foodparty505/rental/
    member do
      patch 'validated'
      patch 'refused'
    end
  end
end
