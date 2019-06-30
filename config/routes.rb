Rails.application.routes.draw do
  resources :users do
    collection do
      get 'count'
    end

    member do
      get 'name'
      resources :shops
    end
  end

  root 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
