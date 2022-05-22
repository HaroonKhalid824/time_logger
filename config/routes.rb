Rails.application.routes.draw do
  resources :attendances
  devise_for :users

  root to: 'attendances#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
