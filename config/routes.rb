Rails.application.routes.draw do
  
  
 
  get 'homes/top'
  get 'homes/about' => 'homes#about',as: 'about'
  
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show]
  resources :users, only: [:show, :edit, :update]
end
