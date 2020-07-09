Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'my_portofolio', to: 'users#my_portofolio'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
