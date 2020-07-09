Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'my_portofolio', to: 'users#my_portofolio'
  get 'search_stock', to: 'stocks#search'
end
