Rails.application.routes.draw do



  get 'homes/top'
  get 'home/about' => 'homes#about',as: 'about'

  devise_for :users
  root to: "homes#top"

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :index]
end
