Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # 
  root to:"items#index"
  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :purchase_records, only: [:index, :create]
  end
end
