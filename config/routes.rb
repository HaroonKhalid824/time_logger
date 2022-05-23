# frozen_string_literal: true

Rails.application.routes.draw do
  resources :attendances
  resources :attendances do
    collection do
      post 'clock_in'
      post 'clock_out'
    end
  end
  devise_for :users

  root to: 'attendances#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
