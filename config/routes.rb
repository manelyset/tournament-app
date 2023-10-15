Rails.application.routes.draw do
  root 'teams#index'

  resources :teams, only: %i[index create]
  resources :tours, only: %i[index]
end
