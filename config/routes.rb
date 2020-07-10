Rails.application.routes.draw do
  resources :user_stocks
  devise_for :users
  root 'welcome#index'
  get 'my_portofolio', to: 'users#my_portofolio'
  get 'search_stock', to: 'stocks#search'
end