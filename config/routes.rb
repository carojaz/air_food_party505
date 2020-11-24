Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :account do
    resources :rentals, only: [:index, :show] do
     member do
        patch 'validated'
        patch 'refused'
      end
    end
  end

  resources :devices do  #foodparty505/device/
    resources :rentals #foodparty505/rental/
  end
end
